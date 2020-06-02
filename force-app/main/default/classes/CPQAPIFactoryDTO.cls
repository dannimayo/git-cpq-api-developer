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
        public CPQFactoryDTO.QuoteModel quote;

        @InvocableVariable
        public CPQFactoryDTO.ProductModel[] products;

        @InvocableVariable
        public Integer groupKey;

    }

    public class CalculateQuoteAPIRequest{

        //todo

        //todo

        //todo

    }

    public class SaveQuoteAPIRequest{

        @InvocableVariable
        public CPQFactoryDTO.QuoteModel quote;

        @InvocableVariable
        public String callbackClass;

    }


    //responses start here

    public class ReadQuoteAPIResponse{

        @InvocableVariable
        public CPQFactoryDTO.QuoteModel quote;

    }

    public class ReadProductAPIResponse{
        
        @InvocableVariable
        public CPQFactoryDTO.ProductModel product;

    }

    public class AddProductsAPIResponse{

        @InvocableVariable
        public CPQFactoryDTO.QuoteModel quote;

    }

    public class SaveQuoteAPIResponse{

        @InvocableVariable
        public CPQFactoryDTO.QuoteModel quote;

    }
    

}
