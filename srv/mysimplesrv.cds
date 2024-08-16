using myCompany.hr.lms from '../db/Students';

// service mysrvdemo @(path: 'mylms') {
// http://localhost:4004/odata/v4/mylms/GetStudent
//
// service mysrvdemo @(path: '/mylms') {
// http://localhost:4004/mylms/GetStudent
//
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

service mysrvdemoapp {


}


// moved to mynewsrv.cds
//extend service mysrvdemo with {
//    @readonly
//    entity CustomGetStudent as
//        projection on lms.Students {
// /           *,
//            first_name || ' ' || last_name as full_name : String
//        }
//        excluding {
//            date_sign_up
//        }
//}
