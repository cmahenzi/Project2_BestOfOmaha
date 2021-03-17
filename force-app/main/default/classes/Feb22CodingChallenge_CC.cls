public inherited sharing class Feb22CodingChallenge_CC {
    public List<Feb22CodingChallenge_Wrapper> aSumRev {
        get {
            if (aSumRev == null) {
                Map<String, Double> oppRevByAccount = Feb15CodingChallenge.getOppRevByAccount();
                aSumRev = new List <Feb22CodingChallenge_Wrapper>();
                for (String name : oppRevByAccount.keySet()){
                    double sum = oppRevByAccount.get(name);
                    aSumRev.add(new Feb22CodingChallenge_Wrapper(name, sum));

                }
            }
            return aSumRev;        
        }
        set;
    }
}