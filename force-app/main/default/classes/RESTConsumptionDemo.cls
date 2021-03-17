public class RESTConsumptionDemo {
    public static String makeCallout() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.balldontlie.io/api/v1/games/38');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200) {
            Object deserializedResponse = JSON.deserializeUntyped(response.getBody());
            system.debug(deserializedResponse);
            Map<String, Object> respMap = (Map<String, Object>) deserializedResponse;
            Map<String, Object> homeTeamMap = (Map<String, Object>) respMap.get('home_team');
            Map<String, Object> awayTeamMap = (Map<String, Object>) respMap.get('visitor_team');
            
            Date gameDate = Date.valueOf(String.valueOf(respMap.get('date')));
            String homeTeamName = String.valueOf(homeTeamMap.get('full_name'));
            String awayTeamName = String.valueOf(awayTeamMap.get('full_name'));
            Integer homeTeamScore = Integer.valueOf(respMap.get('home_team_score'));
            Integer awayTeamScore = Integer.valueOf(respMap.get('visitor_team_score'));
            
            String winningTeam, losingTeam;
            Integer winningScore, losingScore;
            
            if(homeTeamScore > awayTeamScore) {
                winningTeam = homeTeamName;
                losingTeam = awayTeamName;
                winningScore = homeTeamScore;
                losingScore = awayTeamScore;
            } else {
                winningTeam = awayTeamName;
                losingTeam = homeTeamName;
                winningScore = awayTeamScore;
                losingScore = homeTeamScore;
            }
            
            String gameInfo = 'On ' + gameDate.month() + '/' + gameDate.day() + '/' + gameDate.year() + ', the ' +
                winningTeam + ' beat the ' + losingTeam + ' by a score of ' + winningScore + ' to ' + losingScore +
                ' in ' + String.valueOf(homeTeamMap.get('city')) + '.';
            return gameInfo;
        }
        
        return null;
    }
    
    public static String makeCalloutJSONParser() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://www.balldontlie.io/api/v1/games/38');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        
        if(response.getStatusCode() == 200) {
            JSONParser parser = JSON.createParser(response.getBody());
			
            String winningTeam, losingTeam, homeTeam, awayTeam, city, gameDateString;
            Integer winningScore;
            Integer losingScore;
            Integer homeTeamScore;
            Integer awayTeamScore;
            Date gameDate;
            
            while(parser.nextToken() != null) {
                if((parser.getCurrentToken() == JSONToken.START_OBJECT) && (parser.getCurrentName() != null)) {
                    Team teamInfo = (Team) parser.readValueAs(Team.Class);
                    if(parser.getCurrentName() == 'home_team') {
                        homeTeam = teamInfo.full_name;
                        city = teamInfo.city;
                    } else {
                        awayTeam = teamInfo.full_name;
                    }
                    parser.skipChildren();
                } else {
                    switch on parser.getCurrentName() {
                        when 'date' {
                            parser.nextValue();
                            gameDateString = parser.getText();
                            gameDate = Date.valueOf(gameDateString.substring(0 , gameDateString.indexOf(' ')));
                        }
                        when 'home_team_score' {
                            parser.nextValue();
                            homeTeamScore = parser.getIntegerValue();
                        } when 'visitor_team_score' {
                            parser.nextValue();
                            awayTeamScore = parser.getIntegerValue();
                        }
                    }
                }
            }
            
           if(homeTeamScore > awayTeamScore) {
                winningTeam = homeTeam;
                losingTeam = awayTeam;
                winningScore = homeTeamScore;
                losingScore = awayTeamScore;
            } else {
                winningTeam = awayTeam;
                losingTeam = homeTeam;
                winningScore = awayTeamScore;
                losingScore = homeTeamScore;
            }
            
           /* return gameDate.month() + '/' + gameDate.day() + '/' + gameDate.year() + ', the ' +
                winningTeam + ' beat the ' + losingTeam + ' by a score of ' + winningScore + ' to ' + losingScore +
                ' in ' + city + '.';*/
        }
        return null;
    }
    
    public class Team {
        String full_name;
        String city;
        
        public team(String full_name, String city){
            this.full_name = full_name;
            this.city = city;
        }
    }
}