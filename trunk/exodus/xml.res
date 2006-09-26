        ��  ��                  ;:  4   X M L   D E F A U L T S         0 	        <exodus version="0.9">
  <prefs>
    <defaults_xml_cvs_id value="$Id: defaults.xml,v 1.44 2004/09/08 17:15:03 hildjj Exp $"/>
    
    <!-- System Options -->
    <auto_update_url value="http://exodus.jabberstudio.org/exodus-released.exe"/>
    <auto_update_changelog_url value="http://exodus.jabberstudio.org/changelog.html"/>
    
    <auto_updates value="1" control="chkAutoUpdate"/>
    <auto_start value="0" control="chkAutoStart"/>
    <debug value="0" control="chkDebug"/>
    <min_start value="0" control="chkStartMin"/>        
    <autologin value="0" control="chkAutoLogin"/>        
    <window_ontop value="0" control="chkOnTop" state="inv"/>
    <window_toolbox value="0" control="chkToolbox"/>        
    <close_min value="1" control="chkCloseMin"/>
    <single_instance value="1" control="chkSingleInstance"/>
    <default_nick control="txtDefaultNick">
      <control name="lblDefaultNick"/>
    </default_nick>
    
    <!-- AutoAway Options -->
    <auto_away value="1" control="chkAutoAway"/>
    <aa_reduce_pri value="1" control="chkAAReducePri"/>
    <auto_xa value="1" control="chkAutoXA"/>
    <auto_disconnect value="0" control="chkAutoDisconnect"/>
    <away_time value="5" control="spnAway"/>
    <xa_time value="30" control="spnXA"/>
    <disconnect_time value="180" control="spnDisconnect"/>        
    <away_status control="txtAway">
      <control name="lblAwayStatus"/>
    </away_status>
    <xa_status control="txtXA">
      <control name="lblXAStatus"/>
    </xa_status>
    <away_auto_response value="0" control="chkAwayAutoResponse"/>

    <!-- Roster Options -->                    	
    <roster_show_unsub value="0" control="chkShowUnsubs"/>
    <roster_show_pending value="1" control="chkShowPending"/>
    <roster_hide_block value="0" control="chkHideBlocked"/>
    <roster_pres_errors  value="0" control="chkPresErrors"/>
    <roster_unicode value="true" control="chkRosterUnicode"/>
    <roster_chat value="2" control="cboDblClick">
      <control name="lblDblClick"/>
    </roster_chat>
    <inline_status value="0" control="chkInlineStatus"/>
    <inline_color value="8421376" control="cboInlineStatus"/>
    <nested_groups value="1" control="chkNestedGrps"/>
    <group_seperator value="/" control="txtGrpSeperator"/>
    <roster_avatars value="false" control="chkRosterAvatars"/>
    
    <!-- Roster Group Options -->
    <roster_sort value="0" control="chkSort"/>
    <roster_groupcounts value="1" control="chkGroupCounts"/>
    <roster_collapsed value="0" control="chkCollapsed"/>
    <roster_offline_group value="0" control="chkOfflineGrp"/>
    <roster_only_online value="0" control="chkOnlineOnly"/>
    <roster_default value="Friends" control="txtDefaultGrp">
      <control name="lblDefaultGrp"/>
    </roster_default>
    <roster_transport_grp value="Transports" control="txtGatewayGrp">
      <control name="lblGatewayGrp"/>
    </roster_transport_grp>
    <roster_filter value="0" control="cboVisible">
      <control name="lblFilter"/>
    </roster_filter>            
    
    <!-- Dialog Options -->
    <roster_alpha value="0" control="chkRosterAlpha"/>
    <toast_alpha value="0" control="chkToastAlpha"/>
    <snap_on value="1" control="chkSnap"/>
    <warn_closebusy value="1" control="chkBusy"/>
    <roster_alpha_val value="255" control="spnRosterAlpha">
      <control name="trkRosterAlpha"/>
      <control name="txtRosterAlpha"/>
    </roster_alpha_val>
    <toast_alpha_val value="255" control="spnToastAlpha">
      <control name="trkToastAlpha"/>
      <control name="txtToastAlpha"/>
    </toast_alpha_val>
    <toast_duration value="5" control="txtToastDuration">
      <control name="lblToastDuration"/>
    </toast_duration>
    <edge_snap value="15" control="spnSnap">
      <control name="txtSnap"/>
      <control name="trkSnap"/>
    </edge_snap>
    <chat_memory value="60" control="spnChatMemory">
      <control name="txtChatMemory"/>
      <control name="trkChatMemory"/>
    </chat_memory>
    <esc_close value="1" control="chkEscClose"/>
    <close_hotkey value="None" control="txtCloseHotkey"/>
    
    <!-- fonts and colors -->
    <font_name value="Arial"/>
    <font_size value="10"/>
    <font_color value="0"/>
    <font_charset value="1"/>
    <font_bold value="0"/>
    <font_italic value="0"/>
    <font_underline value="0"/>
    <color_bg value="$ffffff"/>
    <color_me value="$ff0000"/>
    <color_other value="$0000ff"/>
    <color_time value="$808080"/>
    <color_action value="$800080"/>
    <color_server value="$008000"/>
    <roster_bg value="$80000005"/>
    <roster_font_color value="0"/>
    <roster_font_size value="10"/>
    <roster_font_charset value="1"/>
    <msglist_type value="0" control="cboMsgList"/>
    <ie_css value="" control="cboIEStylesheet"/>
    
    <!-- Layouts -->
    <expanded value="0"/>
    <dock_locked value="0"/>
    <roster_messenger value="1"/>
    <stacked_tabs value="1"/>

    <event_width value="400"/>
    <roster_width value="215"/>

    <restore_window_state value="0" control="chkSaveWindowState"/>
    <restore_desktop value="0" control="chkRestoreDesktop"/>
    
    <!-- Message Options -->
    <timestamp value="1" control="chkTimestamp"/>
    <timestamp_format value="t" control="txtTimestampFmt">
      <control name="lblTimestampFmt"/>
    </timestamp_format>
    <msg_queue value="0" control="chkMsgQueue"/>
    <block_nonroster value="0" control="chkBlockNonRoster"/>
    <log value="1" control="chkLog"/>
    <log_rooms value="0" control="chkLogRooms"/>
    <log_roster value="0" control="chkLogRoster"/>
    <log_path control="txtLogPath"/>
    <spool_path control="txtSpoolPath">
      <control name="lblSpoolPath"/>
    </spool_path>
    <invite_treatment value="0" control="cboInviteOptions">
      <control name="lblInviteOptions"/>
    </invite_treatment>
    <msg_treatment value="0" control="cboMsgOptions">
      <control name="lblMsgOptions"/>
    </msg_treatment>
    <queue_offline value="1" control="chkQueueOffline"/>
    <queue_dnd_chats value="0" control="chkQueueDNDChats"/>
    <chat_avatars value="1" control="chkChatAvatars"/>

    <!-- Emoticon Options -->
    <emoticons value="1" control="chkEmoticons"/>
    <emoticon_dlls>
      <s>msn_emoticons.dll</s>
      <s>yahoo_emoticons.dll</s>
    </emoticon_dlls>
    <custom_icondefs value="custom-icons.xml" control="txtCustomEmoteFilename"/>

    <!-- Network Options -->
    <recon_tries value="25" control="spnAttempts">
      <control name="lblAttempts"/>
      <control name="txtAttempts"/>
    </recon_tries>
    <recon_time value="0" control="spnTime">
      <control name="lblTime"/>
      <control name="txtTime"/>
    </recon_time>        
    <http_proxy_approach value="0" control="cboProxyApproach">
      <control name="lblProxyApproach"/>
    </http_proxy_approach>
    <http_proxy_auth value="false" control="chkProxyAuth"/>
    <http_proxy_host control="txtProxyHost">
      <control name="lblProxyHost"/>
    </http_proxy_host>
    <http_proxy_port value="8080" control="txtProxyPort">
      <control name="lblProxyPort"/>
    </http_proxy_port>
    <http_proxy_password control="txtProxyPassword">
      <control name="lblProxyPassword"/>
    </http_proxy_password>
    <http_proxy_user control="txtProxyUsername">
      <control name="lblProxyUsername"/>
    </http_proxy_user>
    
    <!-- Notification Options -->
    <notify_sounds value="1" control="chkSound"/>
    <notify_active value="1" control="chkNotifyActive"/>
    <notify_active_win value="0" control="chkNotifyActiveWindow"/>
    <notify_flasher value="1" control="chkFlashInfinite"/>
    
    <notify_online value="1"/>
    <notify_offline value="0"/>
    <notify_newchat value="1"/>
    <notify_normalmsg value="1"/>
    <notify_s10n value="1"/>
    <notify_invite value="1"/>
    <notify_keyword value="1"/>
    <notify_chatactivity value="4"/>
    <notify_roomactivity value="1"/>
    <notify_oob value="1"/>
    <notify_autoresponse value="0"/>                     
    
    <!-- Presence Options -->
    <pres_tracking value="1" control="cboPresTracking">
      <control name="lblPresTracking"/>
    </pres_tracking>
    <presence_message_listen value="1" control="chkPresenceSync"/>
    <presence_message_send value="1" control="chkPresenceSync"/>
    <client_caps value="1" control="chkClientCaps"/>
    <client_caps_uri value="http://exodus.jabberstudio.org/caps"/>
    <room_joins value="1" control="chkRoomJoins"/>        
    
    <!-- Subscription Options -->
    <s10n_auto_accept value="0" control="optIncomingS10n"/>
    <s10n_auto_add value="true" control="chkIncomingS10nAdd"/>
    
    <!-- file xfer Options -->
    <xfer_path control="txtXferPath">
      <control name="lblXferPath"/>
    </xfer_path>        
    <xfer_port value="5280" control="txtXferPort">
      <control name="lblXferPort"/>
    </xfer_port>
    <xfer_ip control="txtXferIP">
      <control name="chkXferIP"/>
    </xfer_ip>
    <xfer_davhost control="txtDavHost">
      <control name="lblDavHost"/>
    </xfer_davhost>
    <xfer_davport control="txtDavPort">
      <control name="lblDavPort"/>
    </xfer_davport>
    <xfer_davpath control="txtDavPath">
      <control name="lblDavPath"/>
    </xfer_davpath>
    <xfer_davusername control="txtDavUsername">
      <control name="lblDavUsername"/>
    </xfer_davusername>
    <xfer_davpassword control="txtDavPassword">
      <control name="lblDavPassword"/>
    </xfer_davpassword>
    <xfer_prefproxy control="txt65Proxy">
      <control name="lbl65Proxy"/>
    </xfer_prefproxy>
    
    
    <!-- unfiled -->
    <toolbar value="1" />
    <chat_toolbar value="1" />
    <always_lang value="0"></always_lang>       
    <brand_ad ></brand_ad>
    <brand_ad_url ></brand_ad_url>
    <!-- application ID is different than caption. It is used for
         file, path, resource identification and must be a legal value
         in any of those contexts. Caption may be anything. -->
    <brand_application_id value="Exodus"></brand_application_id>
    <brand_caption value="Exodus"></brand_caption>
    <brand_help_menu_list>
      <s>Jabber User Guide</s>
      <s>Exodus Website</s>
      <s>Add Feature Request</s>
      <s>Report Bug</s>
      <s>Jabber.org Website</s>
      <s>JabberStudio Website</s>
    </brand_help_menu_list>
    <brand_help_url_list>
      <s>http://www.jabber.org/user/userguide/</s>
      <s>http://exodus.jabberstudio.org/</s>
      <s>http://www.jabberstudio.org/projects/exodus/features/</s>
      <s>http://www.jabberstudio.org/projects/exodus/bugs/</s>
      <s>http://www.jabber.org/</s>
      <s>http://www.jabberstudio.org/</s>
    </brand_help_url_list>
    <brand_icon ></brand_icon>
    <brand_profile_conn_type value="0"></brand_profile_conn_type>
    <brand_profile_new_account_default value="true" control="chkRegister" state="rw"></brand_profile_new_account_default>
    <brand_profile_host ></brand_profile_host>
    <brand_profile_http_poll value="1000"></brand_profile_http_poll>
    <brand_profile_http_url ></brand_profile_http_url>
    <brand_profile_num_poll_keys value="256"></brand_profile_num_poll_keys>
    <brand_profile_password ></brand_profile_password>
    <brand_profile_port value="5222"></brand_profile_port>
    <brand_profile_priority value="1"></brand_profile_priority>
    <brand_profile_resource value="Exodus"></brand_profile_resource>
    
    <brand_profile_resource_list>
      <s>Home</s>
      <s>Work</s>
      <s>Exodus</s>
    </brand_profile_resource_list>

    <brand_profile_save_password ></brand_profile_save_password>
    <brand_profile_server value="jabber.org"></brand_profile_server>
    <brand_profile_winlogin value="false"></brand_profile_winlogin>

    <brand_profile_server_list>
      <s>jabber.org</s>
      <s>jabber.com</s>
    </brand_profile_server_list>
    
    <brand_profile_socks_auth value="false"></brand_profile_socks_auth>
    <brand_profile_socks_host ></brand_profile_socks_host>
    <brand_profile_socks_password ></brand_profile_socks_password>
    <brand_profile_socks_port value="1080"></brand_profile_socks_port>
    <brand_profile_socks_type value="0"></brand_profile_socks_type>
    <brand_profile_socks_user ></brand_profile_socks_user>
    <brand_profile_ssl value="false"></brand_profile_ssl>
    <brand_profile_srv value="true"></brand_profile_srv>
    <brand_profile_username ></brand_profile_username>
    <brand_muc value="1"></brand_muc>
    <brand_ft value="1"></brand_ft>
    <brand_plugs value="1"></brand_plugs>
    <brand_addcontact_gateways value="1"/>
    <brand_registration value="1"/>
    <brand_browser value="1"/>
    <brand_vcard value="1"></brand_vcard>
    
    <!-- add roster network prefs.
        This brandable pref defines networks that will show in the
        Add to Roster dialog. The pref is a tuple of display name, network type
        and type specific data. tuple looks like this
        <delim>display name<delim>transport|in-network<delim>data<delim>
        <delim> can be any non xml reserved character.
        display name cannot be empty or the tuple is ignored.

        Types recognized by Exodus are "transport" and "in-network", any other
        type will cause the tuple to be ignored.
        A transport is a gateway, the type specific data asscoiated with this
        type is the disco id of the transport (MSN -> msn etc). Exdous will
        attempt to disco a server for the transport and force registration etc.
        in-network means xmpp is used for subscription, with no additional
        requirements. The extra data asociated with this type is an autocompletion
        domain. For instance, the Jinc AIM "gateway" is implemented as part of
        s2s, not a gateway. The user simply s10n with foo@aol.com.

        The Jabber network is assumed and treated as in-network with an
        autocompletion of the users domain.

        All parts of the tuple must be defined or the entire thing is ignored.

    -->
    <brand_networks>
        <s>|MSN|transport|msn|</s>
        <s>|Yahoo|transport|yahoo|</s>
        <s>|AIM|transport|aim|</s>
        <s>|ICQ|transport|icq|</s>
    </brand_networks>

    <!-- end roster network prefs -->

    <!-- use JID autocompletion where possible -->
    <brand_auto_complete_jids value="1"/>
    
    <browse_view value="0"></browse_view>

    <fade_limit value="100"></fade_limit>
    <profile_active value="0"></profile_active>
    <wrap_input value="1"></wrap_input>

  </prefs>

  <!-- default custom presence stuff -->
  <presii>
  </presii>

</exodus>
 ?
  ,   X M L   L A N G S       0 	        <langs>
<om>(Afan) Oromo</om>
<ab>Abkhazian</ab>
<aa>Afar</aa>
<af>Afrikaans</af>
<sq>Albanian</sq>
<am>Amharic</am>
<ar>Arabic</ar>
<hy>Armenian</hy>
<as>Assamese</as>
<ay>Aymara</ay>
<az>Azerbaijani</az>
<ba>Bashkir</ba>
<eu>Basque</eu>
<bn>Bengali</bn>
<dz>Bhutani</dz>
<bh>Bihari</bh>
<bi>Bislama</bi>
<br>Breton</br>
<bg>Bulgarian</bg>
<my>Burmese</my>
<be>Byelorussian</be>
<km>Cambodian</km>
<ca>Catalan</ca>
<zh>Chinese</zh>
<co>Corsican</co>
<hr>Croatian</hr>
<cs>Czech</cs>
<cz>Czech</cz>
<da>Danish</da>
<dk>Danish</dk>
<nl>Dutch</nl>
<en>English</en>
<eo>Esperanto</eo>
<et>Estonian</et>
<fo>Faeroese</fo>
<fj>Fiji</fj>
<fi>Finnish</fi>
<fr>French</fr>
<fy>Frisian</fy>
<gl>Galician</gl>
<ka>Georgian</ka>
<de>German</de>
<el>Greek</el>
<kl>Greenlandic</kl>
<gn>Guarani</gn>
<gu>Gujarati</gu>
<ha>Hausa</ha>
<he>Hebrew </he>
<hi>Hindi</hi>
<hu>Hungarian</hu>
<is>Icelandic</is>
<id>Indonesian </id>
<ia>Interlingua</ia>
<ie>Interlingue</ie>
<ik>Inupiak</ik>
<iu>Inuktitut (Eskimo)</iu>
<ga>Irish</ga>
<it>Italian</it>
<ja>Japanese</ja>
<jw>Javanese</jw>
<kn>Kannada</kn>
<ks>Kashmiri</ks>
<kk>Kazakh</kk>
<rw>Kinyarwanda</rw>
<ky>Kirghiz</ky>
<rn>Kirundi</rn>
<ko>Korean</ko>
<ku>Kurdish</ku>
<lo>Laothian</lo>
<la>Latin</la>
<lv>Latvian, Lettish</lv>
<ln>Lingala</ln>
<lt>Lithuanian</lt>
<mk>Macedonian</mk>
<mg>Malagasy</mg>
<ms>Malay</ms>
<ml>Malayalam</ml>
<mt>Maltese</mt>
<mi>Maori</mi>
<mr>Marathi</mr>
<mo>Moldavian</mo>
<mn>Mongolian</mn>
<na>Nauru</na>
<ne>Nepali</ne>
<no>Norwegian</no>
<oc>Occitan</oc>
<or>Oriya</or>
<ps>Pashto, Pushto</ps>
<fa>Persian</fa>
<pl>Polish</pl>
<pt>Portuguese</pt>
<pa>Punjabi</pa>
<qu>Quechua</qu>
<rm>Rhaeto-Romance</rm>
<ro>Romanian</ro>
<ru>Russian</ru>
<sm>Samoan</sm>
<sg>Sangro</sg>
<sa>Sanskrit</sa>
<gd>Scots Gaelic</gd>
<sr>Serbian</sr>
<sh>Serbo-Croatian</sh>
<st>Sesotho</st>
<tn>Setswana</tn>
<sn>Shona</sn>
<sd>Sindhi</sd>
<si>Singhalese</si>
<ss>Siswati</ss>
<sk>Slovak</sk>
<sl>Slovenian</sl>
<so>Somali</so>
<es>Spanish</es>
<su>Sudanese</su>
<sw>Swahili</sw>
<sv>Swedish</sv>
<tl>Tagalog</tl>
<tg>Tajik</tg>
<ta>Tamil</ta>
<tt>Tatar</tt>
<te>Tegulu</te>
<th>Thai</th>
<bo>Tibetan</bo>
<ti>Tigrinya</ti>
<to>Tonga</to>
<ts>Tsonga</ts>
<tr>Turkish</tr>
<tk>Turkmen</tk>
<tw>Twi</tw>
<ug>Uigur</ug>
<uk>Ukrainian</uk>
<ur>Urdu</ur>
<uz>Uzbek</uz>
<vi>Vietnamese</vi>
<vo>Volapuk</vo>
<cy>Welch</cy>
<wo>Wolof</wo>
<xh>Xhosa</xh>
<yi>Yiddish (former ji)</yi>
<yo>Yoruba</yo>
<za>Zhuang</za>
<zu>Zulu</zu>
</langs> �  4   X M L   C O U N T R I E S       0 	        <countries>
<AD>Andorra, Principality of</AD>
<AE>United Arab Emirates</AE>
<AF>Afghanistan, Islamic State of</AF>
<AG>Antigua and Barbuda</AG>
<AI>Anguilla</AI>
<AL>Albania</AL>
<AM>Armenia</AM>
<AN>Netherlands Antilles</AN>
<AO>Angola</AO>
<AQ>Antarctica</AQ>
<AR>Argentina</AR>
<AS>American Samoa</AS>
<AT>Austria</AT>
<AU>Australia</AU>
<AW>Aruba</AW>
<AZ>Azerbaidjan</AZ>
<BA>Bosnia-Herzegovina</BA>
<BB>Barbados</BB>
<BD>Bangladesh</BD>
<BE>Belgium</BE>
<BF>Burkina Faso</BF>
<BG>Bulgaria</BG>
<BH>Bahrain</BH>
<BI>Burundi</BI>
<BJ>Benin</BJ>
<BM>Bermuda</BM>
<BN>Brunei Darussalam</BN>
<BO>Bolivia</BO>
<BR>Brazil</BR>
<BS>Bahamas</BS>
<BT>Bhutan</BT>
<BV>Bouvet Island</BV>
<BW>Botswana</BW>
<BY>Belarus</BY>
<BZ>Belize</BZ>
<CA>Canada</CA>
<CC>Cocos (Keeling) Islands</CC>
<CF>Central African Republic</CF>
<CD>Congo, The Democratic Republic of the</CD>
<CG>Congo</CG>
<CH>Switzerland</CH>
<CI>Ivory Coast (Cote D'Ivoire)</CI>
<CK>Cook Islands</CK>
<CL>Chile</CL>
<CM>Cameroon</CM>
<CN>China</CN>
<CO>Colombia</CO>
<CR>Costa Rica</CR>
<CS>Former Czechoslovakia</CS>
<CU>Cuba</CU>
<CV>Cape Verde</CV>
<CX>Christmas Island</CX>
<CY>Cyprus</CY>
<CZ>Czech Republic</CZ>
<DE>Germany</DE>
<DJ>Djibouti</DJ>
<DK>Denmark</DK>
<DM>Dominica</DM>
<DO>Dominican Republic</DO>
<DZ>Algeria</DZ>
<EC>Ecuador</EC>
<EDU>Educational</EDU>
<EE>Estonia</EE>
<EG>Egypt</EG>
<EH>Western Sahara</EH>
<ER>Eritrea</ER>
<ES>Spain</ES>
<ET>Ethiopia</ET>
<FI>Finland</FI>
<FJ>Fiji</FJ>
<FK>Falkland Islands</FK>
<FM>Micronesia</FM>
<FO>Faroe Islands</FO>
<FR>France</FR>
<FX>France (European Territory)</FX>
<GA>Gabon</GA>
<GB>Great Britain</GB>
<GD>Grenada</GD>
<GE>Georgia</GE>
<GF>French Guyana</GF>
<GH>Ghana</GH>
<GI>Gibraltar</GI>
<GL>Greenland</GL>
<GM>Gambia</GM>
<GN>Guinea</GN>
<GP>Guadeloupe (French)</GP>
<GQ>Equatorial Guinea</GQ>
<GR>Greece</GR>
<GS>S. Georgia & S. Sandwich Isls.</GS>
<GT>Guatemala</GT>
<GU>Guam (USA)</GU>
<GW>Guinea Bissau</GW>
<GY>Guyana</GY>
<HK>Hong Kong</HK>
<HM>Heard and McDonald Islands</HM>
<HN>Honduras</HN>
<HR>Croatia</HR>
<HT>Haiti</HT>
<HU>Hungary</HU>
<ID>Indonesia</ID>
<IE>Ireland</IE>
<IL>Israel</IL>
<IN>India</IN>
<IO>British Indian Ocean Territory</IO>
<IQ>Iraq</IQ>
<IR>Iran</IR>
<IS>Iceland</IS>
<IT>Italy</IT>
<JM>Jamaica</JM>
<JO>Jordan</JO>
<JP>Japan</JP>
<KE>Kenya</KE>
<KG>Kyrgyz Republic (Kyrgyzstan)</KG>
<KH>Cambodia, Kingdom of</KH>
<KI>Kiribati</KI>
<KM>Comoros</KM>
<KN>Saint Kitts & Nevis Anguilla</KN>
<KP>North Korea</KP>
<KR>South Korea</KR>
<KW>Kuwait</KW>
<KY>Cayman Islands</KY>
<KZ>Kazakhstan</KZ>
<LA>Laos</LA>
<LB>Lebanon</LB>
<LC>Saint Lucia</LC>
<LI>Liechtenstein</LI>
<LK>Sri Lanka</LK>
<LR>Liberia</LR>
<LS>Lesotho</LS>
<LT>Lithuania</LT>
<LU>Luxembourg</LU>
<LV>Latvia</LV>
<LY>Libya</LY>
<MA>Morocco</MA>
<MC>Monaco</MC>
<MD>Moldavia</MD>
<MG>Madagascar</MG>
<MH>Marshall Islands</MH>
<MIL>USA Military</MIL>
<MK>Macedonia</MK>
<ML>Mali</ML>
<MM>Myanmar</MM>
<MN>Mongolia</MN>
<MO>Macau</MO>
<MP>Northern Mariana Islands</MP>
<MQ>Martinique (French)</MQ>
<MR>Mauritania</MR>
<MS>Montserrat</MS>
<MT>Malta</MT>
<MU>Mauritius</MU>
<MV>Maldives</MV>
<MW>Malawi</MW>
<MX>Mexico</MX>
<MY>Malaysia</MY>
<MZ>Mozambique</MZ>
<NA>Namibia</NA>
<NC>New Caledonia (French)</NC>
<NE>Niger</NE>
<NET>Network</NET>
<NF>Norfolk Island</NF>
<NG>Nigeria</NG>
<NI>Nicaragua</NI>
<NL>Netherlands</NL>
<NO>Norway</NO>
<NP>Nepal</NP>
<NR>Nauru</NR>
<NT>Neutral Zone</NT>
<NU>Niue</NU>
<NZ>New Zealand</NZ>
<OM>Oman</OM>
<PA>Panama</PA>
<PE>Peru</PE>
<PF>Polynesia (French)</PF>
<PG>Papua New Guinea</PG>
<PH>Philippines</PH>
<PK>Pakistan</PK>
<PL>Poland</PL>
<PM>Saint Pierre and Miquelon</PM>
<PN>Pitcairn Island</PN>
<PR>Puerto Rico</PR>
<PT>Portugal</PT>
<PW>Palau</PW>
<PY>Paraguay</PY>
<QA>Qatar</QA>
<RE>Reunion (French)</RE>
<RO>Romania</RO>
<RU>Russian Federation</RU>
<RW>Rwanda</RW>
<SA>Saudi Arabia</SA>
<SB>Solomon Islands</SB>
<SC>Seychelles</SC>
<SD>Sudan</SD>
<SE>Sweden</SE>
<SG>Singapore</SG>
<SH>Saint Helena</SH>
<SI>Slovenia</SI>
<SJ>Svalbard and Jan Mayen Islands</SJ>
<SK>Slovak Republic</SK>
<SL>Sierra Leone</SL>
<SM>San Marino</SM>
<SN>Senegal</SN>
<SO>Somalia</SO>
<SR>Suriname</SR>
<ST>Saint Tome (Sao Tome) and Principe</ST>
<SU>Former USSR</SU>
<SV>El Salvador</SV>
<SY>Syria</SY>
<SZ>Swaziland</SZ>
<TC>Turks and Caicos Islands</TC>
<TD>Chad</TD>
<TF>French Southern Territories</TF>
<TG>Togo</TG>
<TH>Thailand</TH>
<TJ>Tadjikistan</TJ>
<TK>Tokelau</TK>
<TM>Turkmenistan</TM>
<TN>Tunisia</TN>
<TO>Tonga</TO>
<TP>East Timor</TP>
<TR>Turkey</TR>
<TT>Trinidad and Tobago</TT>
<TV>Tuvalu</TV>
<TW>Taiwan</TW>
<TZ>Tanzania</TZ>
<UA>Ukraine</UA>
<UG>Uganda</UG>
<UK>United Kingdom</UK>
<UM>USA Minor Outlying Islands</UM>
<US>United States</US>
<UY>Uruguay</UY>
<UZ>Uzbekistan</UZ>
<VA>Holy See (Vatican City State)</VA>
<VC>Saint Vincent & Grenadines</VC>
<VE>Venezuela</VE>
<VG>Virgin Islands (British)</VG>
<VI>Virgin Islands (USA)</VI>
<VN>Vietnam</VN>
<VU>Vanuatu</VU>
<WF>Wallis and Futuna Islands</WF>
<WS>Samoa</WS>
<YE>Yemen</YE>
<YT>Mayotte</YT>
<YU>Yugoslavia</YU>
<ZA>South Africa</ZA>
<ZM>Zambia</ZM>
<ZR>Zaire</ZR>
<ZW>Zimbabwe</ZW>
</countries>   