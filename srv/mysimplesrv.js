const cds = require("@sap/cds");

// namespace of the entities
const { Students } = cds.entities("myCompany.hr.lms");


module.exports = (srv) => {

    srv.on("READ", "StudentSRV", async (req, res) => {
        console.log("hello");

        const { SELECT } = cds.ql;
        const aFilter = req.query.SELECT.from.ref[0].where;
        console.log(aFilter);
        //const result = await SELECT.from(Students).where({ email: "demo@demo.com" });
        if (typeof aFilter === "undefined") {
            return await SELECT.from(Students).limit(2);
        }
        const result = await SELECT.from(Students).where(aFilter);
        console.log(result);
        return result
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



