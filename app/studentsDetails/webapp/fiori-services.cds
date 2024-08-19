using mysrvdemoapp as serviceStudent from '../../../srv/mysimplesrv';


annotate serviceStudent.GetStudent with @(UI: {

    SelectionFields                : [

    ],
    LineItem                       : [
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
    HeaderInfo                     : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Student',
        TypeNamePlural: 'Students',
        Title         : {Value: last_name},
        Description   : {
            Value: first_name,
            Label: 'first_name'
        }
    },

    Facets                         : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'Personal Information',
        Target: '@UI.FieldGroup#PersonalStudentInfo'
    }],

    FieldGroup #PersonalStudentInfo: {
        $Type: 'UI.FieldGroupType',
        Label: 'Personal Data',
        Data : [
            {
                Label: 'First Name',
                Value: first_name
            },
            {
                Label: 'Last Name',
                Value: last_name
            },
            {
                Label: 'Email',
                Value: email
            },
            {
                Label: 'Date Sign Up',
                Value: date_sign_up
            }


        ]
    },

//    HeaderInfo     : {
//        $Type         : 'UI.HeaderInfoType',
//        TypeName      : 'Email',
//        TypeNamePlural: 'Emails',
//        Description   : {Value: email}
//    },
});
