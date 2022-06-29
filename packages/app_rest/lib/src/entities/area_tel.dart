import 'package:json_annotation/json_annotation.dart';

part 'area_tel.g.dart';

@JsonSerializable()
class AreaTel {
  List<String>? A;
  List<String>? B;
  List<String>? C;
  List<String>? D;
  List<String>? E;
  List<String>? F;
  List<String>? G;
  List<String>? H;
  List<String>? I;
  List<String>? J;
  List<String>? K;
  List<String>? L;
  List<String>? M;
  List<String>? N;
  List<String>? O;
  List<String>? P;
  List<String>? Q;
  List<String>? R;
  List<String>? S;
  List<String>? T;
  List<String>? U;
  List<String>? V;
  List<String>? W;
  List<String>? X;
  List<String>? Y;
  List<String>? Z;

  AreaTel({
    this.A,
    this.B,
    this.C,
    this.D,
    this.E,
    this.F,
    this.G,
    this.H,
    this.I,
    this.J,
    this.K,
    this.L,
    this.M,
    this.N,
    this.O,
    this.P,
    this.Q,
    this.R,
    this.S,
    this.T,
    this.U,
    this.V,
    this.W,
    this.X,
    this.Y,
    this.Z,
  });

  factory AreaTel.fromJson(Map<String, dynamic> json) {
    return _$AreaTelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AreaTelToJson(this);

  Map<String, List<String>?> getMap() {
    Map<String, List<String>?> map = {};
    map['A'] = A;
    map['B'] = B;
    map['C'] = C;
    map['D'] = D;
    map['E'] = E;
    map['F'] = F;
    map['G'] = G;
    map['H'] = H;
    map['I'] = I;
    map['J'] = J;
    map['K'] = K;
    map['L'] = L;
    map['M'] = M;
    map['N'] = N;
    map['O'] = O;
    map['P'] = P;
    map['Q'] = Q;
    map['R'] = R;
    map['S'] = S;
    map['T'] = T;
    map['U'] = U;
    map['V'] = V;
    map['W'] = W;
    map['X'] = X;
    map['Y'] = Y;
    map['Z'] = Z;

    return map;
  }
}
