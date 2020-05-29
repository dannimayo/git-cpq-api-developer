@isTest
private class EmailQuoteLineControllerTest {
        
    testMethod static void getFields() {
        EmailQuoteLineController qlc = new EmailQuoteLineController();
        List<Schema.FieldSetMember> test = qlc.getFields();
        System.assert(test.size() > 0); 
    }

    testMethod static void getQuoteLineItems() {
        EmailQuoteLineController qlc = new EmailQuoteLineController();
        Account acct = new Account();
        acct.Name = 'test123';
        insert acct;

        Pricebook2 pb = new Pricebook2();
        pb.Name = 'test';
        insert pb;

        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.AccountId = acct.Id;
        opp.StageName = 'New';
        opp.CloseDate = date.newInstance(2020, 06, 17);
        opp.Pricebook2Id = pb.Id;
        insert opp;

        SBQQ__Quote__c quote = new SBQQ__Quote__c();
        quote.SBQQ__Opportunity2__c = opp.Id;
        insert quote;

        qlc.relatedId = quote.Id;

        List<SBQQ__QuoteLine__c> test = qlc.getQuoteLineItems();
        System.assert(test.size() == 0);    
    }
}