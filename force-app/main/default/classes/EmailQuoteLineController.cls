// README
// This class is used for the quote line component that displays quote line items in the visual force email template.
// The displayed line item table is dynamic, which is based off a fieldset on the quote line. The fieldset can be
// used to show and hide fields in the line item table.  The fieldset is Email_Quote_Line_Display located on 
// quote line object.


public class EmailQuoteLineController {
    // Id passed into the apex component attribute from email template.
    public String relatedId { get; set;}
    public List<SBQQ__QuoteLine__c> QLs { get; set; }

    public EmailQuoteLineController() {
        
    }
    // This method gets the schema for the fieldset used in the query and display.
    public List<Schema.FieldSetMember> getFields() {
        return SObjectType.SBQQ__QuoteLine__c.FieldSets.Email_Quote_Line_Display.getFields();
    }
 
    // Query the quote line items and use the fieldset to determine the fields queried in the records.
    public List<SBQQ__QuoteLine__c> getQuoteLineItems() {
        // A dynamic query string that's concatenated together with fieldset and quote Id.
        String query = 'SELECT ';
        for(Schema.FieldSetMember f : this.getFields()) {
            query += f.getFieldPath() + ', ';
        }
        query += 'Id FROM SBQQ__QuoteLine__c Where SBQQ__Quote__c =';
        query += '\''+relatedId+'\'';
        // Runs the query.
        return Database.query(query);
    }
}