using myCompany.hr.lms from '../db/Students';
using {myCompany.hr.lms1 as lms1} from '../db/Structure';

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
    @readonly
    entity GetStudent    as projection on lms1.Students;

    @readonly
    entity GetCourse     as projection on lms1.Courses;

    @readonly
    entity GetContent    as projection on lms1.Contents;

    @readonly
    entity GetEnrollment as projection on lms1.Enrollments;
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
