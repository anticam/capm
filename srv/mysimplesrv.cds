using myCompany.hr.lms from '../db/Students';

service mysrvdemo {

    @readonly
    entity GetStudent        as projection on lms.Students;

    @updateonly
    entity UpdateStudent     as projection on lms.Students;

    @updateonly
    entity UpdateStudentJohn as projection on lms.Students;

}
