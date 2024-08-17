const cds = require("@sap/cds");

// namespace of the entities
const { Students } = cds.entities("myCompany.hr.lms");


module.exports["mysrvdemo"] = (srv) => {

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

        const tx = cds.transaction(req);
        const affectedRows = await tx.run(
            UPDATE(Students)
                .set({ first_name: "Mr. " + firstName })
                //.where({ email: studentEmail })
                .where({ first_name: 'john' })
        )

        if (affectedRows == 0) return req.error(409, "no records found");


        return req.data;
    });

    srv.on("CREATE", "UpdateStudentJohn", async (req, res) => {

        const { INSERT } = cds.ql;
        // const result = await SELECT.from(Students).where(aFilter);
        const result = await INSERT.into(Students).entries({
            first_name: req.data.first_name,
            email: req.data.email,
            last_name: req.data.last_name,
            date_sign_up: req.data.date_sign_up
        });
        return result;

    });

    srv.on("CREATE", "InsertStudent", async (req) => {

        const tx = cds.tx(req);

        try {
            const createdEntity = await tx.run(INSERT.into(Students).entries(
                [
                    {
                        email: req.data.email,
                        first_name: req.data.first_name,
                        last_name: req.data.last_name,
                        date_sign_up: req.data.date_sign_up
                    }
                ]
            ));
        } catch (e) {
            await tx.rollback(e);
            console.log(e);
        }
        // console.log(createdEntity);
        return req.data;

    });

    // https://cap.cloud.sap/docs/node.js/events
    srv.on("DELETE", "DeleteStudent", async (req) => {

        const tx = cds.tx(req);

        try {
            const deletedEntity = await tx.run(DELETE.from(Students).where(
                { email: req.data.email }
            ));
        } catch (e) {
            await tx.rollback(e);
            console.log(e);
        }
        // console.log(createdEntity);
        return req.data;
    });

    srv.on("DELETE", "DeleteStudent2", async (req) => {

        const tx = cds.tx(req);

        const deletedEntity = await tx.run(DELETE.from(Students).where(
            { email: req.data.email }
        ))
            .then((resolve, reject) => {
                console.log("resolve:", resolve);
                console.log("reject:", reject);
            })
            .catch(err => {
                console.log(err);
                tx.rollback(e);
                req.error(500, "Error");
            });

        // console.log(createdEntity);
        return req.data;
    });

};

module.exports["mysrvdemoapp"] = (srv) => {

    srv.before("READ", "GetStudent", (req, res) => {
        console.log("Inside GetStudent");

    });

    srv.before("READ", "GetCourse", async (req, res) => {
        console.log("Inside GetCourse");

    });

    srv.before("READ", "GetContent", async (req, res) => {
        console.log("Inside GetContent");

    });

    srv.before("READ", "GetEnrollment", async (req, res) => {
        console.log("Inside GetEnrollment");

    });



}

