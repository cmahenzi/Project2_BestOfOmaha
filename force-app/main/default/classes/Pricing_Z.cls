public class Pricing_Z {
		public Integer price {get;set;} 
		public String dollar {get;set;} 
		public String priceString {get;set;} 

		public Pricing_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'price') {
							price = parser.getIntegerValue();
						} else if (text == 'currency') {
							dollar = parser.getText();
						} else if (text == 'priceString') {
							priceString = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Pricing_Z consuming unrecognized property: '+text);
							//consumeObject(parser);
						}
					}
				}
			}
		}
	}