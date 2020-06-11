public class CPQQuoteProductAdderAPI {
    
    @InvocableMethod(label = 'addProducts')
    public static List<CPQAPIFactoryDTO.AddProductsAPIResponse> addProducts(List<CPQAPIFactoryDTO.AddProductsAPIRequest> flowInput){
        CPQAPIFactoryDTO.AddProductsAPIRequest req = flowInput.get(0);
        CPQAPIFactoryDTO.AddProductsAPIResponse resp = new CPQAPIFactoryDTO.AddProductsAPIResponse();
        resp.quote = addProductsAPI(req.quote, req.products, req.groupKey);
        System.debug('This is the response from addProductsAPI & set to CPQAPIFactoryDTO.AddProductsAPIResponse: \n' + resp);
        
        return new List<CPQAPIFactoryDTO.AddProductsAPIResponse>{resp};
    }
    

    //get quoteModel with products 
    public static CPQFactoryDTO.QuoteModel addProductsAPI(CPQFactoryDTO.QuoteModel quote, CPQFactoryDTO.ProductModel[] products, Integer groupKey) {
        AddProductsContext ctx = new AddProductsContext(quote, products, groupKey);
        String quoteJSON = SBQQ.ServiceRouter.load('SBQQ.QuoteAPI.QuoteProductAdder', null, JSON.serialize(ctx));
        return (CPQFactoryDTO.QuoteModel) JSON.deserialize(quoteJSON, CPQFactoryDTO.QuoteModel.class);
    }


    private class AddProductsContext {
        private CPQFactoryDTO.QuoteModel quote;
        private CPQFactoryDTO.ProductModel[] products;
        private Integer groupKey;
        private final Boolean ignoreCalculate = true; //Must be hardcoded to true
    
        private AddProductsContext(CPQFactoryDTO.QuoteModel quote, CPQFactoryDTO.ProductModel[] products, Integer groupKey) {
            this.quote = quote;
            this.products = products;
            this.groupKey = groupKey;
        }
    }

    
}
