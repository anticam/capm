const cds = require("@sap/cds");

// namespace of the entities
const { Students } = cds.entities("myCompany.hr.lms");


module.exports = (srv) => {

    srv.on("READ", "GetStudent", async (req, res) => {
        console.log("hello");

        const { SELECT } = cds.ql;
        const aFilter = req.query.SELECT.from.ref[0].where;
        console.log(aFilter);

        if (typeof aFilter !== "undefined") {
            // with filters
            const result = await SELECT.from(Students).where(aFilter);
            return result;
        }

        // without filters
        const tempResult = await SELECT.from(Students);
        return tempResult;
    });

    srv.after("READ", "GetStudent", data => {
        let finalValue = data.map(d => {
            d.first_name = d.first_name + " " + d.last_name;
            //return d;
        })

        console.log(finalValue);

        return finalValue;
    });

    srv.on("CREATE", "UpdateStudent", async (req, res) => {

        let firstName = req.data.first_name;
        let studentEmail = req.data.email;

        let returnData = await cds
            .transaction(req)
            .run(() => {
                UPDATE(Students).set({
                    first_name: firstName
                }).where({
                    email: studentEmail
                });
            }).then((resolve, reject) => {
                if (typeof resolve !== "undefined" && resolve >= 1) {
                    // return data here

                } else {
                    req.error(500, "Error in Updating Record");
                }

            }).catch((err) => {
                console.log(err);
                req.error(500, "Error in Updating Record - catch");
            });

        return req.data;
    });

    srv.on("CREATE", "UpdateStudentJohn", async (req, res) => {

        let firstName = req.data.first_name;
        // let studentEmail = req.data.email;

        let result = await UPDATE(Students).set({
            first_name: "Mr. " + firstName
        }).where({
            first_name: firstName
        });

        console.log(result);

        return req.data;
    });

}




// req.query.SELECT.from.ref[0].where[2].val
// 'demo@demo.com'

// demoP = new Promise()
// demoP
//    .then((resolve, reject) => {
//        // code when resolved
//        result = value;
//    })
//    .catch(err => {
//
//    })
//    .final(() => {
//
//    });



