using myCompany.hr.lms from '../db/Students';

service first {
    @readonly
    entity Students as projection on lms.Students;
};

service mysrvdemo {

    @readonly
    entity StudentSRV as projection on lms.Students;

    function myfoobar(msg : String) returns String;

}
