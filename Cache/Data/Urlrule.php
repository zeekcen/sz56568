<?php	return array (
  1 => 
  array (
    'urlruleid' => '1',
    'ishtml' => '0',
    'showurlrule' => '{$catdir}/show/{$id}.html|{$catdir}/show/{$id}_{$p}.html',
    'showexample' => 'news/show/1.html|news/show/1_1.html',
    'listurlrule' => '{$catdir}/|{$catdir}/{$p}.html',
    'listexample' => 'news/|news/1.html',
    'listorder' => '0',
  ),
  2 => 
  array (
    'urlruleid' => '2',
    'ishtml' => '0',
    'showurlrule' => 'show-{$catid}-{$id}.html|show-{$catid}-{$id}-{$p}.html',
    'showexample' => 'show-1-1.html|show-1-1-1.html',
    'listurlrule' => 'list-{$catid}.html|list-{$catid}-{$p}.html',
    'listexample' => 'list-1.html|list-1-1.html',
    'listorder' => '0',
  ),
  3 => 
  array (
    'urlruleid' => '3',
    'ishtml' => '0',
    'showurlrule' => '{$module}/show/{$id}.html|{$module}/show/{$id}-{$p}.html',
    'showexample' => 'Article/show/1.html|Article/show/1-1.html',
    'listurlrule' => '{$module}/list/{$catid}.html|{$module}/list/{$catid}-{$p}.html',
    'listexample' => 'Article/list/1.html|Article/list/1-1.html',
    'listorder' => '0',
  ),
  4 => 
  array (
    'urlruleid' => '4',
    'ishtml' => '1',
    'showurlrule' => '{$parentdir}{$catdir}/show_{$id}.html|{$parentdir}{$catdir}/show_{$id}_{$p}.html',
    'showexample' => 'news/show_1.html|news/show_1_1.html',
    'listurlrule' => '{$parentdir}{$catdir}/|{$parentdir}{$catdir}/{$p}.html',
    'listexample' => 'news/|news/1.html',
    'listorder' => '0',
  ),
);?>