<<<<<<< HEAD
public class CPQQuotingAPI { 
=======
public class CPQQuotingAPI {

    //TODO: create @InvocableMethod readQuote..
    @InvocableMethod(label='readQuote')
    public static List<CPQAPIFactoryDTO.ReadQuoteAPIResponse> readQuote(List<CPQAPIFactoryDTO.ReadQuoteAPIRequest> request){
        CPQAPIFactoryDTO.ReadQuoteAPIRequest req = request.get(0);
        CPQFactoryDTO.QuoteModel response = readQuoteAPI(req.quoteId);

        CPQAPIFactoryDTO.ReadQuoteAPIResponse returnResponse = new CPQAPIFactoryDTO.ReadQuoteAPIResponse();
        returnResponse.quote = response;
        return new List<CPQAPIFactoryDTO.ReadQuoteAPIResponse>{returnResponse};
        //1 takes the CPQAPIFactoryDTO.ReadQuoteAPIRequest
        //2 extracts quoteId 
        //3 calls this.readQuoteAPI
        //4 returns CPQAPIFactoryDTO.ReadQuoteAPIResponse
    }

    //TODO: create @InvocableMethod readProduct..
    public List<CPQAPIFactoryDTO.ReadProductAPIResponse> readProduct(List<CPQAPIFactoryDTO.ReadProductAPIRequest> request){
        return new List<CPQAPIFactoryDTO.ReadProductAPIResponse>();
    }
    
    //TODO: create @InvocableMethod addProducts.. 
    public List<CPQAPIFactoryDTO.AddProductsAPIResponse> addProducts(List<CPQAPIFactoryDTO.AddProductsAPIRequest> request){
        return new List<CPQAPIFactoryDTO.AddProductsAPIResponse>();
    }

    //TODO: create @InvocableMethod calculateQuote..
    public void calculateQuote(List<CPQAPIFactoryDTO.CalculateQuoteAPIRequest> request){
        
    }

    //TODO: create @InvocableMethod saveQuote..
    public List<CPQAPIFactoryDTO.SaveQuoteAPIResponse> saveQuote(List<CPQAPIFactoryDTO.SaveQuoteAPIRequest> request){
        return new List<CPQAPIFactoryDTO.SaveQuoteAPIResponse>();
    }

    /*
    /
    / 
    /
    */


    //get quoteModel
    public static CPQFactoryDTO.QuoteModel readQuoteAPI(String quoteId) {
        String quoteJSON = SBQQ.ServiceRouter.read('SBQQ.QuoteAPI.QuoteReader', quoteId);
        return (CPQFactoryDTO.QuoteModel) JSON.deserialize(quoteJSON, CPQFactoryDTO.QuoteModel.class);
    }


    //get productModel
    public CPQFactoryDTO.ProductModel readProductAPI(Id productId, Id pricebookId, String currencyCode) {
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


    //get quoteModel with products
    public CPQFactoryDTO.QuoteModel addProductsAPI(CPQFactoryDTO.QuoteModel quote, CPQFactoryDTO.ProductModel[] products, Integer groupKey) {
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
    
    
    //send quoteModel to calculate
    public void calculateQuoteAPI(CPQFactoryDTO.QuoteModel quote, String callbackClass) {
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


    //send quoteModel to save
    public CPQFactoryDTO.QuoteModel saveQuoteAPI(CPQFactoryDTO.QuoteModel quote) {
        String quoteJSON = SBQQ.ServiceRouter.save('SBQQ.QuoteAPI.QuoteSaver', JSON.serialize(quote));
        return (CPQFactoryDTO.QuoteModel) JSON.deserialize(quoteJSON, CPQFactoryDTO.QuoteModel.class);
    }
    
>>>>>>> dc16b1eb6d3d84fd7e5a3529f410c2db9c37231b
      
    



}