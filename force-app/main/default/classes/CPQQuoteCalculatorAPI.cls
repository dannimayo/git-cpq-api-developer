public class CPQQuoteCalculatorAPI {

    @InvocableMethod(label = 'calculateQuote')
    public static void calculateQuote(List<CPQAPIFactoryDTO.CalculateQuoteAPIRequest> flowInput){
        CPQAPIFactoryDTO.CalculateQuoteAPIRequest req = flowInput.get(0);
        
        calculateQuoteAPI(req.quote, req.callbackClass);
    }


    //send quoteModel to calculate 
    public static void calculateQuoteAPI(CPQFactoryDTO.QuoteModel quote, String callbackClass) {
        QuoteCalculatorContext ctx = new QuoteCalculatorContext(quote, callbackClass);
        SBQQ.ServiceRouter.load('SBQQ.QuoteAPI.QuoteCalculator', null, JSON.serialize(ctx));    
    }  


    private class QuoteCalculatorContext {        
        private CPQFactoryDTO.QuoteModel quote; //The quote and callbackClass properties are called in the API code by the exact names seen here.
        private String callbackClass;           //Altering these property names will cause calculator API calls to fail.
    
        private QuoteCalculatorContext(CPQFactoryDTO.QuoteModel quote, String callbackClass) {
        this.quote = quote;            
        this.callbackClass = callbackClass;        
        }
    }


}
