import 'package:dinamik_ortalama_hesapla/constants/app_constant.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';

class krediDropDownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const krediDropDownWidget({required this.onKrediSecildi, super.key});

  @override
  State<krediDropDownWidget> createState() => _krediDropDownWidgetState();
}

class _krediDropDownWidgetState extends State<krediDropDownWidget> {
  double secilenKrediDegeri = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger) => {
          setState(
            () {
              secilenKrediDegeri = deger!;
              widget.onKrediSecildi(secilenKrediDegeri);
            },
          )
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
    ;
  }
}
