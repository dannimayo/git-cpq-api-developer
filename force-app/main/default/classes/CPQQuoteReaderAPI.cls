public class CPQQuoteReaderAPI {

    @InvocableMethod(label = 'readQuote')
    public static List<CPQAPIFactoryDTO.ReadQuoteAPIResponse> readQuote(List<CPQAPIFactoryDTO.ReadQuoteAPIRequest> flowInput){
        CPQAPIFactoryDTO.ReadQuoteAPIRequest req = flowInput.get(0);
        CPQAPIFactoryDTO.ReadQuoteAPIResponse resp = new CPQAPIFactoryDTO.ReadQuoteAPIResponse();
        resp.quote = JSON.serialize(readQuoteAPI(req.quoteId));
        System.debug('This is the response from readQuoteAPI & set to CPQAPIFactoryDTO.ReadQuoteAPIResponse: \n' + resp);

        return new List<CPQAPIFactoryDTO.ReadQuoteAPIResponse>{resp};
    }


    //get quoteModel 
    public static CPQFactoryDTO.QuoteModel readQuoteAPI(String quoteId) {
        String quoteJSON = SBQQ.ServiceRouter.read('SBQQ.QuoteAPI.QuoteReader', quoteId);
        return (CPQFactoryDTO.QuoteModel) JSON.deserialize(quoteJSON, CPQFactoryDTO.QuoteModel.class);
    }
    


}