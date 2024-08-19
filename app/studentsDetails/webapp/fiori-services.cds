using mysrvdemoapp as serviceStudent from '../../../srv/mysimplesrv';


annotate serviceStudent.GetStudent with @(UI: {

    SelectionFields: [

    ],
    LineItem       : [
        {
            Label: 'Email',
            Value: email,
        },
        {
            Label: 'First Name',
            Value: first_name,
        },
        {
            Label: 'Last Name',
            Value: last_name,
        },

        {
            Label: 'Sign Join',
            Value: date_sign_up,
        }
    ],
    HeaderInfo     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Student',
        TypeNamePlural: 'Students',
        Title         : {Value: last_name},
        Description   : {
            Value: first_name,
            Label: 'first_name'
        }
    },

//    HeaderInfo     : {
//        $Type         : 'UI.HeaderInfoType',
//        TypeName      : 'Email',
//        TypeNamePlural: 'Emails',
//        Description   : {Value: email}
//    },
});
