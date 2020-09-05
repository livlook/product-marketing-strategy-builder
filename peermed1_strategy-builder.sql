-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 05, 2020 at 11:13 AM
-- Server version: 5.7.31
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peermed1_strategy-builder`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` varchar(256) NOT NULL,
  `qid` varchar(256) NOT NULL,
  `content` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `qid`, `content`) VALUES
('1', '1', 'B2C'),
('2', '1', 'B2B'),
('3', '1', 'Both'),
('4', '2', 'Pre-MVP'),
('5', '2', 'MVP/Beta'),
('6', '2', 'Live'),
('7', '3', '$0'),
('8', '3', '$1 - $5,000'),
('9', '3', '$5K+'),
('10', '4', 'Maximize users'),
('11', '4', 'Generate profit'),
('12', '4', 'Scale'),
('13', '4', 'Secure a niche'),
('14', '5', 'My product has unique features'),
('15', '5', 'My product\'s price point is lower than competitors\''),
('16', '5', 'My product serves a specific niche or industry'),
('23', '7', 'Test Answer 1'),
('24', '7', 'Test Answer 2'),
('25', '7', 'Test Answer 3');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` varchar(256) NOT NULL,
  `content` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `content`) VALUES
('1', 'Is your product B2B, B2C, or a mix of both?'),
('2', 'What stage is your product in?'),
('3', 'What\'s your monthly marketing budget?'),
('4', 'What\'s your primary business goal?'),
('5', 'What\'s your competitive advantage?');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(255) NOT NULL,
  `nickname` text NOT NULL,
  `category` varchar(255) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `nickname`, `category`, `title`, `content`) VALUES
(1, 'seo', 'musthave', 'SEO', '<p><b>Search engine optimization (SEO)</b> or app store optimization (ASO) will push your website or app higher in relevant search results.\r\n<ul><li>Use tools like Google Analytics, Google Search Console, and App Store Connect</li>\r\n<li>Make sure your website is secure (HTTPS), fast, and mobile-friendly</li>\r\n<li>Do basic keyword research and include keywords on your website and/or app store page</li>\r\n<li>Documentation or blog content can help boost on-page SEO</li></ul></p>'),
(2, 'email', 'consider', 'Email', '<p><b>Email marketing</b> nurtures leads and keeps customers informed.\r\n<ul><li>Build an email list by offering valuable content to users</li>\r\n<li>Use an email marketing service</li> \r\n<li>Plan a newsletter (or a few!)</li></ul></p>'),
(3, 'orgSoc', 'musthave', 'Organic Social', '<p>The simplest and cheapest way to grow an audience, choosing a relevant social channel for your product is a necessity. \r\n<ul><li>Find your customers&apos; favorite social channels</li>\r\n<li>Make at least 1 account</li>\r\n<li>Post product updates, tips, content, and announcements</li></ul>\r\n</p>'),
(4, 'docs', 'musthave', 'Documentation & Onboarding', '<p>Good <b>documentation and onboarding</b> will make or break customer success.  \r\n<ul><li>Make it easy to get started with clear steps</li>\r\n<li>Use <b>customer service</b> to get an idea of \r\n where users are struggling</li>\r\n<li>Help docs should be easy to get to and through</li>\r\n<li>Incorporate keywords into the documentation to boost SEO</li></ul></p>'),
(5, 'custServ', 'musthave', 'Customer Service', '<p><b>Customer service</b> is the easiest way to have 1-on-1 conversations with your customers.\r\n<ul><li>Make it clear how to contact customer support</li>\r\n<li>Respond promptly, manage expectations</li>\r\n<li>Track common complaints</li></ul></p>'),
(6, 'ppc', 'consider', 'Paid Search', '<p>If people are searching for your product, show up at the top of the search results pages.\r\n<ul><li>More common for B2B products</li>\r\n<li>Make landing pages for different keyword groups</li>\r\n<li>Consider the pros and cons of bidding on your own and competitors&apos; branded keywords</li></ul></p>'),
(7, 'partnerships', 'consider', 'Partnerships', '<p>Build mutually beneficial relationships with companies in your niche.\r\n<ul><li>Reach out directly and offer a partnership or deal\r\n<ul><li>Reciprocal product integrations</li>\r\n<li>Marketing partnerships</li>\r\n<li>Collaborative projects</li></ul></li>\r\n<li>Focus on long-term benefits for your users</li></ul></p>\r\n'),
(8, 'salesEnab', 'consider', 'Sales Enablement', '<p>B2B sales take more time and effort to close - the right marketing assets can help.\r\n<ul><li>Create a clear channel between marketing and sales</li>\r\n<li>Let the sales team request marketing assets and provide feedback\r\n<ul><li>Pages for common questions from leads</li>\r\n<li>Early-funnel lead nurturing</li>\r\n<li>Collaborate on email funnels</li></ul></li></ul>\r\n</p>'),
(9, 'productFocus', 'special', 'Focus on the Product', '<p>Get the MVP up and running for users.<br/>\r\nIn the meantime, consider starting on the must-haves.</p>'),
(10, 'comm', 'consider', 'Community', '<p>Get the word out about your product and <b>build a community.</b>\r\n<ul><li>Create a space for users to communicate with you and each other\r\n<ul><li>Forum on your website</li>\r\n<li>Facebook Groups</li>\r\n<li>Slack channels</li></ul></li>\r\n<li>Encourage leadership to engage on social media</li></ul></p>\r\n'),
(11, 'press', 'consider', 'Press', '<p>Reach out to publications with news or reports about your product. Better yet, publish your own pieces.\r\n<ul><li>Build a press list for announcements or press releases</li>\r\n<li>Write a post and publish it on sites like Medium or Hacker Noon</li>\r\n<li>Share major announcements on social media</li></ul></p>'),
(12, 'paidSoc', 'consider', 'Paid Social', '<p>Budget for direct messaging where your users are spending time online.\r\n<ul><li>Use your best organic channel(s)</li>\r\n<li>Shape your campaigns around goals and KPIs</li>\r\n<li>Consider unique landing pages for campaigns</li></ul></p>\r\n'),
(13, 'magnets', 'consider', 'Lead Magnets', '<p>Create content or tools that potential users find useful and generate leads in your niche.\r\n<ul><li>Collect emails - offer content in exchange for an email address</li>\r\n<li>Content should be relevant and useful</li>\r\n<li>Something more substantial than just a blog post - a report, a free tool, etc.</li></ul></p>'),
(14, 'events', 'consider', 'Events', '<p>Connect with your industry on a more personal level.\r\n<ul><li>Sponsor industry events at any level</li>\r\n<li>Encourage leadership to speak at industry events</li>\r\n<li>Coordinate small events in large metropolitan areas</li></ul></p>'),
(15, 'refProg', 'consider', 'Referral Program', '<p>Encourage your happy customers to get the word out for you.\r\n<ul><li>Consider affiliate sales partnerships with businesses or consultants in your industry</li>\r\n<li>Double-sided referral bonuses build loyalty for both parties</li></ul></p>'),
(16, 'creatives', 'musthave', 'Creative Assets', '<p>Your website, social media, and other assets hugely benefit from unique creatives.\r\n<ul><li>Use tools like Canva or unDraw to build unique creative assets</li>\r\n<li>Hire designers to create unique assets</li>\r\n<li>Optimize creatives and messaging for each platform</li></ul></p>'),
(17, 'website', 'musthave', 'Website', '<p>A necessity. Build a website that tells potential customers what the product is all about.\r\n<ul><li>Be clear and solution-oriented</li>\r\n<li>Use SEO keywords in the website copy</li>\r\n<li>Make important information easy to find - features, pricing, and how to get started</li></ul></p>'),
(18, 'content', 'consider', 'Content', '<p>Content builds trust and proves you know what you&apos;re talking about. Use a blog, vlog, or even consistent social media content.\r\n<li>Determine your goals, then create industry- or product-related insights</li>\r\n<li>Focus on helping your users solve their problems</li>\r\n<li>Consider long-form content for lead magnets</li></ul></p>'),
(19, 'split', 'special', 'Split Strategies', '<p>If your product has a B2C and a B2B side, make separate strategies for each.</p>'),
(20, 'estChannels', 'special', 'Establish Channels and Focus', '<p>Establish a few channels and focus your marketing efforts on building a presence and audience with them.</p>'),
(21, 'scaleChannels', 'special', 'Scale Successful Channels', '<p>If you have a solid budget, scale the channels with the highest ROI.</p>'),
(22, 'priceComp', 'compadv', 'price differentiation', '<p>Emphasize cost savings in your messaging.</p>'),
(23, 'productComp', 'compadv', 'product differentiation', '<p>Highlight what makes the product unique - features, processes, or people.</p>'),
(24, 'nicheComp', 'compadv', 'your niche', '<p>Highlight how the product addresses the niche&apos;s specific needs.</p>');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
