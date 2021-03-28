import 'package:FlutterMobilenet/widgets/profile.dart';
import 'package:graphql/client.dart';

String token = "";
MyProfile profile = new MyProfile();

Future<bool> login(String username, String password) async {
  HttpLink _httpLink = HttpLink(
    'https://veehacks-backend.herokuapp.com/graphql/',
  );

  AuthLink _authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  Link _link = _authLink.concat(_httpLink);
  GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );

  String mutationString = """
  mutation{
  tokenAuth(username:"$username",password:"$password"){
    token
   
  }
}
""";

  MutationOptions options = MutationOptions(
    document: gql(mutationString),
  );

  QueryResult data = await client.mutate(options);
  if (data.hasException) {
    print(data.exception.toString());
    return false;
  }
  token = data.data["tokenAuth"]["token"];
  await getProfile();
  return true;
}

Future<bool> register(String username, String email, String password,
    String name, String gender, String city, String state) async {
  HttpLink _httpLink = HttpLink(
    'https://veehacks-backend.herokuapp.com/graphql/',
  );

  AuthLink _authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  Link _link = _authLink.concat(_httpLink);
  GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );

  String mutationString = """
   mutation{
  createUser(username:"$username",password:"$password",email:"$email",name:"$name",city:"$city",state:"$state",gender:"$gender"){
    __typename
  }
}
""";

  MutationOptions options = MutationOptions(
    document: gql(mutationString),
  );

  QueryResult data = await client.mutate(options);
  if (data.hasException) {
    print(data.exception.toString());
    return false;
  }
  if (await login(username, password)) {
    return true;
  }
  return false;
}

Future<bool> getProfile() async {
  HttpLink _httpLink = HttpLink(
    'https://veehacks-backend.herokuapp.com/graphql/',
  );

  AuthLink _authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  Link _link = _authLink.concat(_httpLink);
  GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );

  String queryString = """
  
{
  me{
    name
    age
    weight
    height
    bmi
    maxScore
    gameLife
  }
}
""";

  QueryOptions options = QueryOptions(
    document: gql(queryString),
  );

  QueryResult data = await client.query(options);
  if (data.hasException) {
    print(data.exception.toString());
    return false;
  }
  var profiledata = data.data;
  profile.name.value = profiledata["me"]["name"];
  profile.age.value = profiledata["me"]["age"];
  profile.weight.value = profiledata["me"]["weight"];
  profile.height.value = profiledata["me"]["height"];
  profile.score.value = profiledata["me"]["maxScore"];
  profile.life.value = profiledata["me"]["gameLife"];
  return true;
}

Future<bool> updateScore() async {
  HttpLink _httpLink = HttpLink(
    'https://veehacks-backend.herokuapp.com/graphql/',
  );

  AuthLink _authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  Link _link = _authLink.concat(_httpLink);
  GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );

  String mutationString = """
 mutation{
  addNutrition(carbs:30,fats:10,vitamins:0,protein:14,foodName:"Sandwich",minerals:0){
    __typename
  }
}
""";

  MutationOptions options = MutationOptions(
    document: gql(mutationString),
  );

  QueryResult data = await client.mutate(options);
  if (data.hasException) {
    print(data.exception.toString());
    return false;
  }

  return true;
}

Future<bool> updateData() async {
  HttpLink _httpLink = HttpLink(
    'https://veehacks-backend.herokuapp.com/graphql/',
  );

  AuthLink _authLink = AuthLink(
    getToken: () async => 'JWT $token',
  );

  Link _link = _authLink.concat(_httpLink);
  GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );
  profile.life.value += 1;
  String mutationString = """
mutation{
  updateUser(life:${profile.life.value},score:${profile.score.value}){
    __typename
  }
}
""";

  MutationOptions options = MutationOptions(
    document: gql(mutationString),
  );

  QueryResult data = await client.mutate(options);
  if (data.hasException) {
    print(data.exception.toString());
    return false;
  }

  return true;
}
