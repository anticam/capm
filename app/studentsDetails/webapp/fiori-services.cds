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

    Facets                         : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Personal Information',
            Target: '@UI.FieldGroup#PersonalStudentInfo'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Enrollment Details',
            Target: 'enrollment/@UI.LineItem' // reference facet
        }
    ],

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

annotate serviceStudent.GetEnrollment with @(UI: {
    LineItem: [
        {
            Label: 'Enrollment ID',
            Value: ID,
        },
        {
            Label: 'Course ID',
            Value: course_ID,
        }
    ],

    //HeaderInfo: {
    //    // $Type         : 'UI.HeaderInfoType',
    //    TypeName      : 'Course',
    //    TypeNamePlural: 'Courses',
    //    Title         : {
    //        $Type: 'UI.DataField',
    //        Value: ID
    //    },
    //    Description   : {
    //        $Type: 'UI.DataField',
    //        Value: course_ID
    //    }
    //},

    Facets  : [{
        $Type : 'UI.ReferenceFacet',
        Label : 'CourseDetails',
        Target: 'course/@UI.FieldGroup#CourseDetails'
    }

    ]


});

annotate serviceStudent.GetCourse with @(UI: {

    HeaderInfo               : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Course',
        TypeNamePlural: 'Courses',
        Title         : {
            $Type: 'UI.DataField',
            Value: ID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: course_name
        }
    },
    FieldGroup #CourseDetails: {
        $Type: 'UI.FieldGroupType',
        Label: 'CourseDetails',
        Data : [
            {
                Label: 'Course Name',
                Value: course_name
            },
            {
                Label: 'Course Duration in Hrs',
                Value: course_duration
            },
            {
                Label: 'Course Price in USD',
                Value: course_price
            },
            {
                Label: 'Course Url',
                Value: course_url
            }


        ]
    },


});
