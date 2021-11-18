package soapService.service;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Updates;

import org.bson.BsonValue;
import org.bson.Document;
import org.bson.types.ObjectId;

import java.util.ArrayList;
import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import soapService.domaine.User;
import static com.mongodb.client.model.Projections.include;


@WebService(name="UserService")
public class UserService{
    private final MongoCollection<User> userCollection;
    public UserService(MongoDatabase database) {
        this.userCollection = database.getCollection("users", User.class);
    }

    @WebMethod(operationName = "getUsers")
    public List<User> getUsers() {
        List<User> users = new ArrayList<User>();
        FindIterable<User> result = this.userCollection.find();
        result.forEach(users::add);
        return  users;
    }

    @WebMethod(operationName = "getUser")
    public User getUser(@WebParam(name="idUser") String idUser) {
        FindIterable<User> result = this.userCollection
                .find(new Document("_id", new ObjectId(idUser)));
        return result.first();
    }

    @WebMethod(operationName = "postUser")
    public BsonValue postUser(@WebParam(name="payload")User payload) {
        return this.userCollection
                .insertOne(payload).getInsertedId();
    }

    @WebMethod(operationName = "updateUser")
    public BsonValue updateUser(
            @WebParam(name="key")String key,
            @WebParam(name="value")String value,
            @WebParam(name="idUser")String idUser
    ) {
        return this.userCollection.updateOne(
                new Document("_id", new ObjectId(idUser)),
                Updates.set(key, value)
        ).getUpsertedId();
    }

    @WebMethod(operationName = "deleteUser")
    public long deleteUser(@WebParam(name="idUser")String idUser) {
        return this.userCollection.deleteOne(new Document("_id", new ObjectId(idUser)))
        .getDeletedCount();
    }

    @WebMethod(operationName = "login")
    public String login(@WebParam(name="user")User user) {
        String logged = "logged";
        return logged;
    }
}
