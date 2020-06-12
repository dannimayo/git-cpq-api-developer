public class CPQAPIFactoryDTO {

    public class ReadQuoteAPIRequest{

        @InvocableVariable
        public String quoteId;

    }

    public class ReadProductAPIRequest{
        
        @InvocableVariable
        public String productId;

        @InvocableVariable
        public String pricebookId;

        @InvocableVariable
        public String currencyCode;

    }

    public class AddProductsAPIRequest{

        @InvocableVariable
        public String quote;
        //public CPQFactoryDTO.QuoteModel quote

        @InvocableVariable
        public List<String> products;
        //public CPQFactoryDTO.ProductModel[] products;

        @InvocableVariable
        public Integer groupKey = 0;

    }

    public class CalculateQuoteAPIRequest{

        @InvocableVariable
        public String quote;
        //public CPQFactoryDTO.QuoteModel quote;

        @InvocableVariable
        public String callbackClass = 'CPQPricingCallbackWithSave';

    }

    public class SaveQuoteAPIRequest{

        @InvocableVariable
        public String quote;
        //public CPQFactoryDTO.QuoteModel quote;

    }

    //
    //responses start here
    //

    public class ReadQuoteAPIResponse{

        @InvocableVariable
        public String quote;
        //public CPQFactoryDTO.QuoteModel quote; --using String so we can use text vars in flow vs apex-defined vars
    }

    public class ReadProductAPIResponse{
        
        @InvocableVariable
        public String product;
        //public CPQFactoryDTO.ProductModel product;
    }

    public class AddProductsAPIResponse{

        @InvocableVariable
        public String quote;
        //public CPQFactoryDTO.QuoteModel quote
    }

    public class SaveQuoteAPIResponse{

        @InvocableVariable
        public String quote;
        //public CPQFactoryDTO.QuoteModel quote;  
    }
    

}