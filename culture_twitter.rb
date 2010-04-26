#!/usr/bin/env ruby
# coding: utf-8

require 'rubygems'
require 'oauth'
require 'json'
require 'hpricot'
require 'open-uri'
require 'yaml'
require 'parsedate'
require 'kconv'
require File.dirname(__FILE__) + '/twitter_oauth'

# Usage:
#  1. ���Υե������Ʊ���ǥ��쥯�ȥ�˰ʲ����ĤΥե���������֤��ޤ���
#   * twitter_oauth.rb
#    * http://github.com/japanrock/TwitterTools/blob/master/twitter_oauth.rb
#   * sercret_key.yml 
#    * http://github.com/japanrock/TwitterTools/blob/master/secret_keys.yml.example
#   * culture.yml
#    * http://github.com/japanrock/TwitterLR_Culture/blob/master/culture.yml
#  2. ���Υե������¹Ԥ��ޤ���
#   ruby lrhert_twitter.rb

class LrCulture
  attr_reader :selected_culture
  attr_reader :select

  def initialize
    # �����ȥǥ��쥯�ȥ�� culture.yml ����ɤ��ޤ�
    @culture = YAML.load_file(File.dirname(__FILE__) + '/culture.yml')
  end

  def head
    ""
  end

  def random_select
    @selected_culture = @culture[select]
  end

  # �ݥ��Ȥ����ϰϤ���ꤹ��
  def select
    @select = rand(80)
  end
end

twitter_oauth = TwitterOauth.new
lr_culture    = LrCulture.new

content  = lr_culture.random_select
head     = lr_culture.head
url      = lr_culture.selected_culture["url"]
contents = lr_culture.selected_culture["contents"]

twitter_oauth.post(head + contents + " - " + url)
