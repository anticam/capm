# Getting Started

Welcome to your new project.

It contains these folders and files, following our recommended project layout:

File or Folder | Purpose
---------|----------
`app/` | content for UI frontends goes here
`db/` | your domain models and data go here
`srv/` | your service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide


## Next Steps

- Open a new terminal and run `cds watch`
- (in VS Code simply choose _**Terminal** > Run Task > cds watch_)
- Start adding content, for example, a [db/schema.cds](db/schema.cds).


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.

### Source
Based on ui5cn content [CAPM](https://www.lab.ui5cn.com/docs/creating-custom-ui5-app)  




run applicaton
```
cds run --in-memory
```

access the app in URLs:  
http://localhost:4004/#Shell-home  
http://localhost:4004/#manage-Students

deploy DB to SQLite, db.sqlite file created:  
```
cds deploy --to sqlite
```

create hdi container:  
```
cf create-service hana hdi-shared somehdi
```

```

```

https://developers.sap.com/tutorials/hana-dbx-extension..html


https://github.com/ajaytech/capmlevel1final

n:n replaced with student 1:n - enrollment - n:1 - courses

https://github.com/SAP-samples/cap-service-integration-codejam/tree/main

https://fakerjs.dev/api/
https://www.npmjs.com/package/cap-js-mockdata?activeTab=readme

http://localhost:4004/odata/v4/mysrvdemoapp/GetStudent('ajay@demo.com')/enrollment(3003)/course
http://localhost:4004/odata/v4/mysrvdemoapp/GetStudent('ajay@demo.com')/enrollment(3003)/course/content
http://localhost:4004/odata/v4/mysrvdemoapp/GetStudent/ajay@demo.com/enrollment/3003/course/content

changing navigation to object page
https://sapui5.hana.ondemand.com/sdk/#/topic/8bd546e27a5f41cea6e251ba04534d70
