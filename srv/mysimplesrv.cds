using myCompany.hr.lms from '../db/Students';

service mysrvdemo {

    @readonly
    entity GetStudent        as projection on lms.Students;

    @updateonly
    entity UpdateStudent     as projection on lms.Students;

    @updateonly
    entity UpdateStudentJohn as projection on lms.Students;

    @insertonly
    entity InsertStudent     as projection on lms.Students;

    @deleteonly
    entity DeleteStudent     as projection on lms.Students;

    @deleteonly
    entity DeleteStudent2    as projection on lms.Students;

}
