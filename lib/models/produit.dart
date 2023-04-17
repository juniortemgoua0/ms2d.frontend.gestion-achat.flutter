import 'dart:core';
import 'dart:ffi';

class Produit {
  String? codeProduit;
  String? label;
  Float? pu;
  int? qteStock;
  int? qteSeuil;

  Produit(
      {this.codeProduit, this.label, this.pu, this.qteSeuil, this.qteStock});
}
