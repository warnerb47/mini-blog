import {listen} from 'soap';
import fs from 'fs';
import http from 'http';
import {
  deleteUser,
  getUser,
  getUsers,
  login,
  postUser,
  updateUser,
} from '../rest/routes/user/user.service';

// the splitter function, used by the service
function splitter_function(args: { splitter: string; message: string}) {
    console.log('splitter_function');
    var splitter = args.splitter;
    var splitted_msg = args.message.split(splitter);
    var result = [];
    for(var i=0; i<splitted_msg.length; i++){
      result.push(splitted_msg[i]);
    }
    return {
        result: result
        }
}

const serviceObject = {
  UserService: {
    UserServiceSoapPort: {
      getUsers: () => {
        return [
          {
            name: "string1",
            login: "string1",
            password: "string1",
            _id: "string1",
          },
          {
            name: "string2",
            login: "string2",
            password: "string2",
            _id: "string2",
          }
        ]
      },
      // getUser,
      // postUser,
      // updateUser,
      // deleteUser,
      // login,
    },
  },
};
// console.log(serviceObject);

export function start() {
  // const serviceObject = {
  //   MessageSplitterService: {
  //       MessageSplitterServiceSoapPort: {
  //           MessageSplitter: splitter_function
  //       },
  //       MessageSplitterServiceSoap12Port: {
  //           MessageSplitter: splitter_function
  //       }
  //   }
  // };

  const serviceObject = {
    UserService: {
      UserServiceSoapPort: {
        getUsers: () => {
          return [
            {
              name: "string1",
              login: "string1",
              password: "string1",
              _id: "string1",
            },
            {
              name: "string2",
              login: "string2",
              password: "string2",
              _id: "string2",
            }
          ]
        },
      },
    },
  };
  // const xml = fs.readFileSync('myservice.wsdl', 'utf8');
  // const xml = fs.readFileSync('service.wsdl', 'utf8');
  const xml = fs.readFileSync('wsdl.xml', 'utf8');
  const server = http.createServer(function(request,response) {
      response.end('404: Not Found: ' + request.url);
  });
  const wsdl_path = "/wsdl";
  const port = 5000;
  server.listen(port);
  listen(server, '/wsdl', serviceObject, xml, () => {
    console.log("soap api avaible on http://localhost:" + port + wsdl_path +"?wsdl");
  });
}

