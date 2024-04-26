@isTest
public with sharing class TestLanguageCourseTrigger {

    @TestSetup
        static void makeData(){
            Language_Course_Instructor__c lcinst = new Language_Course_Instructor__c();
            lcinst.Name = 'Yatin Hiwarkar';
            insert lcinst;
        }

    @IsTest
    static void runLanguageCourseTrigger(){ 
        Language_Course_Instructor__c yatin = [SELECT Id FROM Language_Course_Instructor__c WHERE Name='Yatin Hiwarkar'];
        Test.startTest();
        Language_Course__c lc = new Language_Course__c();
        lc.Name = 'GitHuB crash Course';
        lc.Course_Instructor__c = yatin.Id;
        insert lc;
        Test.stopTest();

        System.assertEquals('GitHuB crash Course', lc.Name);
        
    }
}