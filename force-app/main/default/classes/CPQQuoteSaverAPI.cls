public class CPQQuoteSaverAPI {

    @InvocableMethod(label = 'saveQuote')
    public static List<CPQAPIFactoryDTO.SaveQuoteAPIResponse> saveQuote(List<CPQAPIFactoryDTO.SaveQuoteAPIRequest> flowInput){
        CPQAPIFactoryDTO.SaveQuoteAPIRequest req = flowInput.get(0);
        CPQFactoryDTO.QuoteModel quoteModel = (CPQFactoryDTO.QuoteModel) JSON.deserialize(req.quote, CPQFactoryDTO.QuoteModel.class);

        CPQAPIFactoryDTO.SaveQuoteAPIResponse resp = new CPQAPIFactoryDTO.SaveQuoteAPIResponse();
        resp.quote = JSON.serialize(saveQuoteAPI(quoteModel));
        System.debug('This is the response from saveQuoteAPI & set to CPQAPIFactoryDTO.SaveQuoteAPIResponse: \n' + resp);
        
        return new List<CPQAPIFactoryDTO.SaveQuoteAPIResponse>{resp};
    }


    //send quoteModel to save 
    public static CPQFactoryDTO.QuoteModel saveQuoteAPI(CPQFactoryDTO.QuoteModel quote) {
        String quoteJSON = SBQQ.ServiceRouter.save('SBQQ.QuoteAPI.QuoteSaver', JSON.serialize(quote));
        return (CPQFactoryDTO.QuoteModel) JSON.deserialize(quoteJSON, CPQFactoryDTO.QuoteModel.class);
    }

    
}