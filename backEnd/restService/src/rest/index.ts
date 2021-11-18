import express, { Application, json } from 'express';
import { router } from './routes';

const app: Application = express();


app.use(json());
app.use('/service', router);

export function startServer() {
    app.listen(3000, () => {
        console.log('rest api avaible on: http://localhost:3000');
    });    
}
