import express, { Application, json } from 'express';
import { router } from './routes';

export const app: Application = express();


app.use(json());
app.use('/service', router);
