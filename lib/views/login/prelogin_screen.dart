import 'package:drtest/tools/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class PreloginScreen extends StatelessWidget {
  const PreloginScreen({super.key});

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(emailUri)) {
      throw Exception('Could not launch email');
    }
  }

  Future<void> _launchPhone(String phone) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phone,
    );
    if (!await launchUrl(phoneUri)) {
      throw Exception('Could not launch phone');
    }
  }

  Future<void> _launchTelegram(String username) async {
    final Uri telegramUri = Uri.parse('https://t.me/$username');
    if (!await launchUrl(telegramUri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch Telegram');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          'ACAFiB',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: colorScheme.surfaceContainer,
        foregroundColor: colorScheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 4,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.offAndToNamed("/login");
        },
        backgroundColor: AppColors.primary,
        foregroundColor: colorScheme.onPrimaryContainer,
        icon: const Icon(Icons.login_rounded),
        label: const Text('ورود به سامانه'),
        elevation: 6,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Welcome Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.primary.withValues(alpha: 0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.medical_services_rounded,
                      size: 64,
                      color: colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'به ACAFiB خوش آمدید!',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'سامانه پشتیبان تصمیم گیری بالینی',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onPrimaryContainer
                            .withValues(alpha: 0.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Main Description Card
              Card(
                elevation: 2,
                color: colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'ACAFiB از سرواژه سازی AntiCoagulant in Atrial Fibrillation ساخته شده است. ACAFiB یک وب اپلیکیشن پشیتیبان تصمیم گیری بالینی به منظور انتخاب داروی آنتی کوآگولانت در بیماران فیبریلاسیون دهلیزی و ملاحظات مربوطه می باشد. ACAFiB با بهره گیری از تجربیات برترین اساتید داروسازی بالینی و قلب و عروق دانشگاه علوم پزشکی تهران و در برداشتن محتویات آخرین دستورالعمل های معتبر بالینی موجود در زمینه مدیریت فیبریلاسیون دهلیزی به تسهیل مسیر تصمیم گیری و مرور آخرین شواهد علمی برای پزشکان و داروسازان در زمینه تعیین نیاز به داروی آنتی کوآگولانت، تعیین دوز و تواتر مصرف مناسب ، بررسی تداخلات دارویی و ملاحظات مصرف در بیماران فیبریلاسیون دهلیزی می پردازد.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Features Section
              _buildSectionHeader(
                context,
                'چرا ACAFiB ؟',
                Icons.star_rounded,
                colorScheme.tertiary,
              ),
              const SizedBox(height: 16),

              Card(
                elevation: 2,
                color: colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildFeaturePoint(
                        context,
                        'در برداشتن محتویات آخرین نسخه از بیش از 10 دستورالعمل بالینی معتبر در زمینه مدیریت فیبریلاسیون دهلیزی.',
                        Icons.library_books_rounded,
                      ),
                      _buildFeaturePoint(
                        context,
                        'در برداشتن بیش از 10 محاسبه گر بالینی به منظور تحلیل داده های آزمایشگاهی، دموگرافیک و بالینی بیماران و ارائه توصیه های مربوطه به صورت شخصی سازی شده.',
                        Icons.calculate_rounded,
                      ),
                      _buildFeaturePoint(
                        context,
                        'در برداشتن کلیه داروهای آنتی کوآگولانت خوراکی و تزریقی موجود در بازار دارویی ایران.',
                        Icons.medication_rounded,
                      ),
                      _buildFeaturePoint(
                        context,
                        'در برداشتن بخش بررسی تداخلات دارویی.',
                        Icons.warning_amber_rounded,
                      ),
                      _buildFeaturePoint(
                        context,
                        'ارائه راهکار در خصوص نیاز یا عدم نیاز به ترومبوپروفیلاکسی دارویی در بیماران فیبریلاسیون دهلیزی.',
                        Icons.health_and_safety_rounded,
                      ),
                      _buildFeaturePoint(
                        context,
                        'ارائه دوز و تواتر مصرف صحیح جهت هر یک از داروهای آنتی کوآگولانت بصورت شخصی سازی شده و بر اساس اطلاعات بیمار.',
                        Icons.person_rounded,
                      ),
                      _buildFeaturePoint(
                        context,
                        'ایجاد بستری جهت آموزش و مرور آخرین نکات بالینی در زمینه مدیریت فیبریلاسیون دهلیزی.',
                        Icons.school_rounded,
                        isLast: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // About Section
              _buildSectionHeader(
                context,
                'درباره ما',
                Icons.info_rounded,
                colorScheme.secondary,
              ),
              const SizedBox(height: 16),

              Card(
                elevation: 2,
                color: colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'این سامانه حاصل همکاری مشترک اساتید داروسازی بالینی و قلب و عروق دانشگاه علوم پزشکی تهران می باشد. تلاش ما در این سامانه ایجاد بستری کاربر پسند و ارائه محتویات مبتنی بر آخرین شواهد علمی موجود با طراحی ساده به عنوان یک بستر آموزشی تحت وب و همچنین تسهیل در تصمیم گیری های بالینی بر اساس داده های آزمایشگاهی، بالینی و دموگرافیک بیمار بصورت شخصی سازی شده در زمینه مدیریت فیبریلاسیون دهلیزی می باشد.',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Contact Section
              _buildSectionHeader(
                context,
                'تماس با ما',
                Icons.contact_support_rounded,
                colorScheme.primary,
              ),
              const SizedBox(height: 16),

              Card(
                elevation: 2,
                color: colorScheme.surfaceContainerLow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'ما همواره مشتاق شنیدن نظرات، پیشنهادات و سوالات شما هستیم و خوش حال می شویم که از نظرات شما در جهت ارتقا ابعاد علمی و فنی ACAFiB استفاده کنیم. ما خود را ملزم به پشتیبانی علمی و فنی از ACAFiB می دانیم. جهت ارتباط با پشتیبانی و همچنین ثبت نام در سامانه می توانید از راه های زیر با ما در ارتباط باشید:',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      height: 1.6,
                      color: colorScheme.onSurface,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Contact Information Card
              Card(
                elevation: 4,
                color: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContactRow(
                        context,
                        Icons.email_rounded,
                        'ایمیل: ',
                        'info@acafib.ir',
                        () => _launchEmail('info@acafib.ir'),
                      ),
                      const SizedBox(height: 16),
                      _buildContactRow(
                        context,
                        Icons.alternate_email_rounded,
                        'ایمیل: ',
                        'ACAFiBapp@gmail.com',
                        () => _launchEmail('ACAFiBapp@gmail.com'),
                      ),
                      const SizedBox(height: 16),
                      _buildContactRow(
                        context,
                        Icons.telegram_rounded,
                        'تلگرام: ',
                        '@ACAFiBapp',
                        () => _launchTelegram('ACAFiBapp'),
                      ),
                      const SizedBox(height: 16),
                      _buildPhoneRow(context),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Address Cards
              Card(
                elevation: 2,
                color: colorScheme.surfaceContainerHigh,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.errorContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.location_on_rounded,
                              color: colorScheme.onErrorContainer,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'آدرس دفتر تهران:',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'تهران، انتهای بلوار کشاورز، مجتمع بیمارستانی امام خمینی (ره)، ساختمان بیمارستان ولیعصر (عج)، طبقه همکف، بخش مراقبت های دارویی.',
                        style: theme.textTheme.bodyLarge?.copyWith(
                          height: 1.5,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Divider(
                          color: colorScheme.outline.withValues(alpha: 0.3)),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.tertiaryContainer,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.location_city_rounded,
                              color: colorScheme.onTertiaryContainer,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'آدرس شیراز:',
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'استان : فارس - شهرستان : شیراز - بخش : مرکزی - شهر : شیراز - محله : ولیعصر - کوچه 12/2ولیعصر[14/1ولیعصر] - بن بست طالقانی بن1 - پلاک : 399.0 - طبقه : همکف - واحد : 1',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          height: 1.4,
                          color: colorScheme.onSurface.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Enamad',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      BuildContext context, String title, IconData icon, Color color) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturePoint(BuildContext context, String text, IconData icon,
      {bool isLast = false}) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 2),
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                  color: colorScheme.onSurface,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
        if (!isLast) ...[
          const SizedBox(height: 16),
          Divider(
            color: colorScheme.outline.withValues(alpha: 0.2),
            indent: 40,
          ),
          const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _buildContactRow(BuildContext context, IconData icon, String label,
      String value, VoidCallback onTap) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon, color: colorScheme.onPrimaryContainer, size: 20),
            const SizedBox(width: 12),
            Text(
              label,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            Expanded(
              child: Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  // color: colorScheme.primary,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneRow(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.phone_rounded,
              color: colorScheme.onPrimaryContainer, size: 20),
          const SizedBox(width: 12),
          Text(
            'تلفن: ',
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
          Expanded(
            child: Wrap(
              children: [
                InkWell(
                  onTap: () => _launchPhone('07136263256'),
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      '07136263256',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        // color: colorScheme.primary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Text(' , ',
                    style: theme.textTheme.bodyLarge
                        ?.copyWith(color: colorScheme.onPrimaryContainer)),
                InkWell(
                  onTap: () => _launchPhone('09107001164'),
                  borderRadius: BorderRadius.circular(4),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      '09107001164',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        // color: colorScheme.primary,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
