using myCompany.hr.lms from '../db/Students';
using mysrvdemo as mysrvdemo from './mysimplesrv';

extend service mysrvdemo with @(impl: './mynewsrv.js') {
    @readonly
    entity CustomGetStudent as
        projection on lms.Students {
            *,
            first_name || ' ' || last_name as full_name : String
        }
        excluding {
            date_sign_up
        }
}
