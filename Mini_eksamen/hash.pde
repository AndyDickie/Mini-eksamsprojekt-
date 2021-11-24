String signingSalt = "sQLLlerkk4221€€))";
String hash(String input) {
  try {
    MessageDigest md = MessageDigest.getInstance("SHA-256");
    String inputText = input + signingSalt;
    md.update(inputText.getBytes());
    byte[] byteList = md.digest();

    StringBuffer hashedValueBuffer = new StringBuffer();
    for (byte b : byteList)hashedValueBuffer.append(hex(b));
    return hashedValueBuffer.toString();
  }
  catch (Exception e) {
    System.out.println("Exception: "+e);
  }
  return null;
}
