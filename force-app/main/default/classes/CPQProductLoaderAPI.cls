public class CPQProductLoaderAPI {

    @InvocableMethod(label = 'readProduct')
    public static List<CPQAPIFactoryDTO.ReadProductAPIResponse> readProduct(List<CPQAPIFactoryDTO.ReadProductAPIRequest> flowInput){
        CPQAPIFactoryDTO.ReadProductAPIRequest req = flowInput.get(0);
        CPQAPIFactoryDTO.ReadProductAPIResponse resp = new CPQAPIFactoryDTO.ReadProductAPIResponse();
        resp.product = readProduct(req.productId, req.pricebookId, req.currencyCode);
        System.debug('This is the response from readProductAPI & set to CPQAPIFactoryDTO.ReadProductAPIResponse: \n' + resp);

        return new List<CPQAPIFactoryDTO.ReadProductAPIResponse>{resp};
    }


    //get productModel 
    public static CPQFactoryDTO.ProductModel readProductAPI(Id productId, Id pricebookId, String currencyCode) {
        ProductReaderContext ctx = new ProductReaderContext(pricebookId, currencyCode);
        String productJSON = SBQQ.ServiceRouter.load('SBQQ.ProductAPI.ProductLoader', productId, JSON.serialize(ctx));
        return (CPQFactoryDTO.ProductModel) JSON.deserialize(productJSON, CPQFactoryDTO.ProductModel.class);
    }


    private class ProductReaderContext {
        private Id pricebookId;
        private String currencyCode;
        
        public ProductReaderContext(Id pricebookId, String currencyCode) {
            this.pricebookId = pricebookId;
            this.currencyCode = currencyCode;
        }
    }


    
}
