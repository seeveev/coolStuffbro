public class TestXMLController {
    public void parseXML(XmlStreamReader xsr)
    {
        while(xsr.hasNext())
        {
            if (xsr.getEventType() == XmlTag.START_ELEMENT) 
            {    
                if ('AccrualBalanceSummary' == xsr.getLocalName()) 
                {    
                    parseRoot(xsr);
                }
            }    
            xsr.next();
        }
    }
    public String parseRoot(XmlStreamReader xsr)
    {
        String value ='';
        
        value += '---> ' + xsr.getAttributeValue('', 'EncumberedBalanceInTime');
        System.debug('The value of EncumberedBalanceInTime is ::'+value);
        
        while(xsr.hasNext()) 
        {
            if (xsr.getEventType() == XmlTag.END_ELEMENT) 
            {
                break;
            } 
            else if (xsr.getEventType() == XmlTag.CHARACTERS) 
            {
                value += xsr.getText();
            }
            xsr.next();
        }
        
        return value;
    }
    public TestXMLController()
    {       
            String m_xmlValue = '';
            //Playing with XML
            String xml = '<?xml version="1.0" encoding="UTF-8" ?><Kronos_WFC TimeStamp="9/22/2017 2:39PM GMT-04:00" version="1.0" WFCVersion="8.0.13.674"><Response Status="Success" Timeout="1800" PersonNumber="XMLUSER" Action="Logon" PersonKey="-6" Username="XMLUSER" Object="System"></Response>    <Response Status="Success" Action="Load"><AccrualData BalanceDate="8/28/2017"><AccrualBalances><AccrualBalanceSummary AccrualCodeId="301" AccrualCodeName="Military Time Off" AccrualType="1" EncumberedBalanceInTime="10.0" HoursPerDay="8.0" ProjectedVestedBalanceInTime="0.0" ProjectedDate="8/28/2017" ProjectedGrantAmountInTime="0.0" ProjectedTakingAmountInTime="0.0" VestedBalanceInTime="0.0"/><AccrualBalanceSummary AccrualCodeId="6" AccrualCodeName="02-Extended Illness Bank" AccrualType="1" EncumberedBalanceInTime="20.0" HoursPerDay="8.0" ProjectedVestedBalanceInTime="0.0" ProjectedDate="8/28/2017" ProjectedGrantAmountInTime="0.0" ProjectedTakingAmountInTime="0.0" VestedBalanceInTime="0.0"/><AccrualBalanceSummary AccrualCodeId="4" AccrualCodeName="03-Legal Holiday" AccrualType="1" EncumberedBalanceInTime="30.0" HoursPerDay="8.0" ProjectedVestedBalanceInTime="0.0" ProjectedDate="8/28/2017" ProjectedGrantAmountInTime="0.0" ProjectedTakingAmountInTime="0.0" VestedBalanceInTime="0.0"/><AccrualBalanceSummary AccrualCodeId="1" AccrualCodeName="01-Paid Time Off" AccrualType="1" EncumberedBalanceInTime="40.0" HoursPerDay="8.0" ProjectedVestedBalanceInTime="0.0" ProjectedDate="8/28/2017" ProjectedGrantAmountInTime="0.0" ProjectedTakingAmountInTime="0.0" VestedBalanceInTime="0.0"/></AccrualBalances><Employee><PersonIdentity PersonNumber="3006755"/></Employee></AccrualData></Response><Response Status="Success" Action="Logoff" Object="System"></Response></Kronos_WFC>';
            XmlStreamReader xsr = new XmlStreamReader(xml);  
            parseXML(xsr);
    }
}