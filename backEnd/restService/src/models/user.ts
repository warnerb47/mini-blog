import { Schema } from 'mongoose';
import { IUser } from '../interfaces';

export const userSchema: Schema = new Schema<IUser>({
    name: String,
    login: { type: String, required: true },
    password: { type: String, required: true }
});