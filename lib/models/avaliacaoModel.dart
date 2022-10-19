class AvaliacaoModel {
  final String userName;
  String userProfileImage;
  final String comentario;
  final int estrelas;
  final String idAutonomo;
  String urlImagem;
  final String data;

  AvaliacaoModel(
      {required this.userName,
      this.userProfileImage = '',
      required this.comentario,
      required this.idAutonomo,
      required this.estrelas,
      this.urlImagem = '',
      required this.data});
}
