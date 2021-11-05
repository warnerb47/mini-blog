package soapService.dao;

import com.mongodb.ConnectionString;
import com.mongodb.MongoClientSettings;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

import org.bson.Document;
import org.bson.codecs.configuration.CodecRegistry;
import org.bson.codecs.pojo.PojoCodecProvider;
import org.bson.types.ObjectId;

import static org.bson.codecs.configuration.CodecRegistries.fromProviders;
import static org.bson.codecs.configuration.CodecRegistries.fromRegistries;

public class MongoConnection {

	private String mongo_url = "mongodb+srv://admin:passer@cluster0.k8qnj.mongodb.net/Blog?retryWrites=true&w=majority";
	public MongoDatabase database;

	public MongoConnection() {
		ConnectionString connectionString = new ConnectionString(this.mongo_url);
		MongoClientSettings settings = MongoClientSettings.builder()
				.applyConnectionString(connectionString)
				.build();
		MongoClient mongoClient = MongoClients.create(settings);
		CodecRegistry pojoCodecRegistry = fromRegistries(MongoClientSettings.getDefaultCodecRegistry(), fromProviders(PojoCodecProvider.builder().automatic(true).build()));
		this.database = mongoClient.getDatabase("Blog").withCodecRegistry(pojoCodecRegistry);
	}

	public void insertDocument(String collection,String json) {
		Document payload = Document.parse(json);
		this.database
				.getCollection(collection)
				.insertOne(payload);
	}

	public FindIterable<Document> findDocument(String collection) {
		return this.database.getCollection(collection).find();
	}

	public FindIterable<Document> findDocument(String collection, String json) {
		return this.database.getCollection(collection).find(Document.parse(json));
	}

	public void deleteDocument(String collection, String id) {
		this.database.getCollection(collection)
				.deleteOne(new Document("_id", new ObjectId(id)));
	}

	public static void main(String[] args) {
		MongoConnection connection = new MongoConnection();
		FindIterable<Document> result = connection.findDocument("users", "{name: 'admin'}");
		result.forEach(document -> System.out.println(document.toJson()));
		//connection.insertDocument("users", "{ name: 'warner', login: 'warner', password: 'warner' }");
		//connection.deleteDocument("users","6184ffe860f2946896c46d0b");
	}


}
