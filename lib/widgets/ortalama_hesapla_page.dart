import 'package:dinamik_ortalama_hesapla/constants/app_constant.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  double secilenDeger = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText,
            style: Sabitler.baslikStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              const Expanded(
                flex: 1,
                child: OrtalamaGoster(dersSayisi: 4, ortalama: 2.556),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Text("Liste buraya gelecek"),
            ),
          ),
          //liste
        ],
      ),
    );
  }

  _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          _buildTextFormField(),
          Row(
            children: [
              _buildHarfler(),
            ],
          )
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Matematik",
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
        ),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3),
      ),
    );
  }

  _buildHarfler() {
    return Container(
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger) => {
          setState(
            () {
              secilenDeger = deger!;
            },
          )
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}
