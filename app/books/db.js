const mongoose = require('mongoose')

console.log(process.env.DB_HOST) 
console.log(`$DB_HOST`) 

mongoose.connect("mongodb://process.env.DB_HOST:process.env.DB_PORT/process.env.DB_NAME", {
    useNewUrlParser: true,
    useUnifiedTopology: true,
    useFindAndModify: false,
    useCreateIndex: true
}).then(() => {
    console.log('Connection successful!');
}).catch(() => {
    console.log('Connection failed!');
})