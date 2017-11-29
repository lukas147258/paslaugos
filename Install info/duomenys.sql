--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `first_name`, `last_name`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`) VALUES
(2, 'viktoras', 'Viktoras', 'Viktoraitis', '1kEhQA_QVGftLOXAa0xuK2Vie9VodRQQ', '$2y$13$KrGblsuzhm/EmgznrbJqUeewWR0KakYa6utHzAsIUgIgT3H3w2qiK', NULL, 'viktoras@viktoras.lt', 10, 1511949660, 1511982202),
(3, 'mykolas', 'Mykolas', 'Mykolaitis', 'qAEU31ksLcKmgQheXrLDrvMlZ5YkfL-O', '$2y$13$yZ5yWI5PM854foWfGXFtu.HCGU56PtQGRjjfdE6gAPfVAMB6D.Hcq', NULL, 'mykolas@mykolas.lt', 10, 1511973262, 1511973262),
(4, 'demo', 'Demo', 'Demooo', 'A5m2PR-R6VjBhYbsJNpdxYtJrEKZE_hJ', '$2y$13$9G4mbo9tNW2vtJe.JNu8lOdTkTDq0jU5ghTeCvY8Cehowi92/vI..', NULL, 'demo@demo.demo', 10, 1511976725, 1511976725),
(5, 'edvardas', 'Edvardas', 'Edvardauskas', 'eJ9CxFxlUIoU-2i7og2T0Haqpn1y3qpW', '$2y$13$YzsNaTgOUY8giLYBJZr9keYP1Vq1.bFJtrPqb47vroT4ppS8sKImG', NULL, 'edvardas@edvardas.lt', 10, 1511981242, 1511981242);


--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('add-permission', 1, 'Add a Permission (auth)', NULL, NULL, NULL, NULL),
('admin', 1, 'admin all', NULL, NULL, NULL, NULL),
('all-services-list', 1, 'All services list', NULL, NULL, NULL, NULL),
('change-satus', 1, 'Disable or Enable a User Account', NULL, NULL, NULL, NULL),
('create-services', 1, 'create-services', NULL, NULL, NULL, NULL),
('update-users-service', 1, 'update-users-service', NULL, NULL, NULL, NULL),
('users-profile', 1, 'users-profile', NULL, NULL, NULL, NULL),
('view-settings-page', 1, 'View Settings Page', NULL, NULL, NULL, NULL),
('view-user-list', 1, 'Wiew user list page (settings/user)', NULL, NULL, NULL, NULL);


--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', NULL),
('admin', '4', NULL),
('all-services-list', '5', NULL),
('create-services', '2', NULL),
('create-services', '5', NULL),
('update-users-service', '2', NULL),
('update-users-service', '5', NULL),
('users-profile', '2', NULL);

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('add-permission', 'users-profile'),
('admin', 'add-permission'),
('admin', 'all-services-list'),
('admin', 'change-satus'),
('admin', 'create-services'),
('admin', 'update-users-service'),
('admin', 'users-profile'),
('admin', 'view-settings-page'),
('admin', 'view-user-list');


--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `title`, `description`, `updated_at`, `created_at`) VALUES
(13, 4, 'Sporto klubas', 'Vilniaus sporto klubas!!', '2017-11-29 18:11:13', '2017-11-29 18:11:29'),
(14, 4, 'Girstučio baseinas', 'Sportas, treniruotės, baseinas.', '2017-11-29 19:11:30', '2017-11-29 19:11:30'),
(15, 4, 'Bokso klubas', 'Bendros bokso treniruotės', '2017-11-29 19:11:10', '2017-11-29 19:11:10'),
(16, 5, 'Šokių pamokos', 'Rengiamos Šokių pamokos suaugusiems ir vaikams.', '2017-11-29 19:11:06', '2017-11-29 19:11:06'),
(17, 5, 'Masažas', 'Masažas tau!!!', '2017-11-29 19:11:28', '2017-11-29 19:11:28');

-- --------------------------------------------------------

--
-- Dumping data for table `services_categories`
--

INSERT INTO `services_categories` (`id`, `service_id`, `name`, `description`, `updated_at`, `created_at`) VALUES
(32, 13, 'Treneris', 'Treniruotės su treneriu.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 13, 'Grupinės treniruotės', 'Grupinės treniruotės su treneriu.', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 14, 'GRUPINIAI UŽSIĖMIMAI', 'GRUPINIAI UŽSIĖMIMAI', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 14, 'Baseinas', 'Plaukimas ir kt..', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 14, 'Treniruoklių salė', 'Treniruoklių salė ir kt...', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 15, 'Individualios bokso treniruotės', 'Individualios bokso treniruotės', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 15, 'Vaikų ir jaunimo bokso grupė', 'Vaikų ir jaunimo bokso grupė', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 16, 'Dovanų kuponai', 'Dovanų kuponai', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 17, 'Tailandietiškas viso kūno masažas', 'Tailandietiškas viso kūno masažas', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

