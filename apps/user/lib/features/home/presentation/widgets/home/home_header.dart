import 'package:authentication/authentication.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notifications/notifications.dart';
import 'package:user/features/home/presentation/widgets/home/user_home_screen_app_bar.dart';
import 'package:user/navigation/route.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
    this.profileImageUrl,
    this.onSearchTap,
    this.onNotificationTap,
  });

  final String? profileImageUrl;
  final VoidCallback? onSearchTap;
  final VoidCallback? onNotificationTap;

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppCubit>().state;
    final user = appState.user;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(width: UI.spacing.md),

          // ProfilePictureWidget(
          //   imageUrl: resolvedProfileImageUrl,
          //   size: ProfilePictureSize.md,
          // ),
          SizedBox(width: UI.spacing.xs),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIText.bodySmall(
                  'Hi, ${user?.name}' ?? '',
                  fontWeight: FontWeight.w700,
                  color: UIColor.black,
                ),
                SizedBox(height: 2),
                if (appState.userType != UserRole.driver)
                  BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () async {
                          UIBottomSheet.show(
                            context: context,
                            content: AddressBottomSheet(
                              addresses: state.addresses,
                              selectedId: state.selectedAddressId,
                              onAddNew: (context) async {
                                // final newAddress = await handleAddNewAddress(
                                //   context,
                                // );

                                // if (newAddress != null) {
                                //   context.read<AppCubit>().addAddress(
                                //     newAddress,
                                //   );
                                // }
                              },

                              /// Set default
                              onSetDefault: (address) {
                                context.read<AppCubit>().setDefaultAddress(
                                  address.id,
                                );
                              },

                              /// Select
                              onSelect: (address) {
                                context.read<AppCubit>().setDefaultAddress(
                                  address.id,
                                );
                                // context.pop();
                              },
                            ),
                          );
                          // final userddressModel =
                          //     await LocationSetterUtil.pushToSetLocationScreen(
                          //       context,
                          //     );
                          // if (userddressModel != null) {
                          //   final state = context.read<AppCubit>().state;
                          //   final currentUserData = state.user;
                          //   if (currentUserData == null) return;
                          //   context.read<AuthUserBloc>().add(
                          //     UpdateProfile(
                          //       currentUserData.copyWith(
                          //         latitude: userddressModel.latitude,
                          //         longitude: userddressModel.longitude,
                          //         address: userddressModel.addressTitle,
                          //       ),
                          //     ),
                          //   );
                          // }
                        },
                        child: Row(
                          children: [
                            UISvg(Assets.icons.location, size: 16),

                            SizedBox(width: UI.spacing.xxs),
                            Flexible(
                              child: UIText.bodySmall(
                                user?.address ?? 'no address selected',
                                color: UIColor.neutral400,
                                maxLines: 1,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 16,
                              color: UIColor.neutral400,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
          Container(
            margin: UI.padding.userHomeHeaderActionsMargin,
            padding: UI.padding.userHomeHeaderActionsPadding,
            decoration: BoxDecoration(
              color: UIColor.neutral100,
              borderRadius: BorderRadius.circular(UI.radius.md),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (appState.userType == UserRole.user) ...[
                  GestureDetector(
                    onTap:
                    // onSearchTap ??
                    () {
                      context.push(UserPaths.search);
                    },
                    child: UISvg(Assets.icons.navSearch, size: 20),
                  ),
                  SizedBox(width: UI.spacing.sm),
                ],
                GestureDetector(
                  onTap:
                      onNotificationTap ??
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (c) => NotificationsScreen(),
                          ),
                        );
                        // context.push(UserPaths.notifications); //
                      },
                  child: UISvg(Assets.icons.notification, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddressBottomSheet extends StatefulWidget {
  const AddressBottomSheet({
    super.key,
    required this.addresses,
    required this.selectedId,
    required this.onSelect,
    required this.onAddNew,
    required this.onSetDefault,
  });

  final List<UserddressModel> addresses;
  final int? selectedId;
  final Function(UserddressModel) onSelect;
  final Future<void> Function(BuildContext context) onAddNew;
  final Function(UserddressModel) onSetDefault;

  @override
  State<AddressBottomSheet> createState() => _AddressBottomSheetState();
}

class _AddressBottomSheetState extends State<AddressBottomSheet> {
  int currentId = -1;
  List<UserddressModel> currentAddresss = [];
  @override
  void initState() {
    super.initState();
    currentId = widget.selectedId ?? -1;
    currentAddresss = widget.addresses;
  }

  void setDefault(int id) {
    final exists = currentAddresss.any((a) => a.id == id);
    if (!exists) {
      print('!exists $exists');
      return;
    }

    final updated =
        currentAddresss.map((address) {
          return address.copyWith(isDefault: address.id == id);
        }).toList();

    setState(() {
      currentId = id;
      currentAddresss = updated;
    });
    final selected = updated.cast<UserddressModel?>().firstWhere(
      (a) => a?.id == id,
      orElse: () => null,
    );
    if (selected == null) return;
    widget.onSetDefault(selected);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),

            UIText.bodyLarge('Select Address'),

            const SizedBox(height: 16),

            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: widget.addresses.length,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final address = currentAddresss[index];
                  final isSelected = address.isDefault;
                  return InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      setDefault(address.id);
                    },

                    /// 🔥 Long press → set default
                    //    onLongPress: () => onSetDefault(address),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF2FB),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    UIText.bodyBold(address.name ?? 'Address'),

                                    const SizedBox(width: 8),

                                    if (isSelected)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.green.shade100,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: const Text(
                                          'Default',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ),
                                  ],
                                ),
                                UIText.caption(
                                  address.addressTitle ?? 'Address details',
                                ),
                              ],
                            ),
                          ),

                          // if (isSelected)
                          //   UIImage(
                          //     Assets.images.checkMark1.path,
                          //     // width: UI.sizes.iconMd,
                          //     height: UI.sizes.iconMd,
                          //   ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
              child: UIButton.primary(
                expanded: true,
                onPressed: () async {
                  final newAddress = await handleAddNewAddress(context);
                  if (newAddress == null) return;

                  setState(() {
                    currentAddresss.add(newAddress);
                  });
                  widget.onAddNew(context);
                },
                label: 'Add New Address',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<UserddressModel?> handleAddNewAddress(BuildContext context) async {
    /// 1. Pick location from map
    final location = await LocationSetterUtil.pushToSetLocationScreen(context);

    if (location == null) return null;
    print('location not null');

    // /// 2. Ask for name
    // final name = await _askForAddressName(context);

    // if (name == null || name.isEmpty) return null;

    /// 3. Return full model
    return location;
  }

  Future<String?> _askForAddressName(BuildContext context) async {
    final controller = TextEditingController();

    return showDialog<String>(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Address Name'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Home, Work, etc...'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
