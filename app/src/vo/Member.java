package vo;

public class Member {

  int id;
  String username;
  String password;
  String name;
  String authority;

  public int getId() {
    return id;
  }

  public Member setId(int id) {
    this.id = id;
    return this;
  }

  public String getUsername() {
    return username;
  }

  public Member setUsername(String username) {
    this.username = username;
    return this;
  }

  public String getPassword() {
    return password;
  }

  public Member setPassword(String password) {
    this.password = password;
    return this;
  }

  public String getName() {
    return name;
  }

  public Member setName(String name) {
    this.name = name;
    return this;
  }

  public String getAuthority() {
    return authority;
  }

  public Member setAuthority(String authority) {
    this.authority = authority;
    return this;
  }

}
