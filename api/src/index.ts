import dotenv from "dotenv";
dotenv.config();
import { app } from './rest';
import { start } from './soap';
import mongoose from "mongoose";

mongoose.connect(process.env['MONGODB_URL'] || 'MONGODB_URL');

mongoose.connection.on('connected', () => console.log('Connected to database'));
mongoose.connection.on('error', () => console.error('An error occure while connecting to database'));
mongoose.connection.on('disconnected', () => console.error('disconnected for database'));

// app.listen(3000, () => {
//     console.log('rest api avaible on: http://localhost:3000');
// });

start();
