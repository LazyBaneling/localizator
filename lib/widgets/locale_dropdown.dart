import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:localizator/blocs/localization_bloc.dart';
import 'package:localizator/localization/locales.dart';

class LocaleDropdown extends StatelessWidget {
  const LocaleDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LocalizationBloc localizationBloc = BlocProvider.of<LocalizationBloc>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: BlocBuilder<LocalizationBloc, Locale>(
        builder: (context, state) {
          return DropdownButton<Locale>(
            value: state,
            onChanged: (Locale? newValue) {
              if (newValue != null) {
                localizationBloc.updateLocale(newValue);
              }
            },
            items: Locales.locales.map<DropdownMenuItem<Locale>>((Locale value) {
              return DropdownMenuItem<Locale>(
                value: value,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CountryFlags.flag(value.countryCode ?? 'US'),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        value.languageCode,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            icon: const Icon(Icons.arrow_drop_down),
            elevation: 0,
            underline: Container(),
            borderRadius: BorderRadius.circular(12),
            dropdownColor: Colors.blueGrey,
          );
        },
      ),
    );
  }
}
