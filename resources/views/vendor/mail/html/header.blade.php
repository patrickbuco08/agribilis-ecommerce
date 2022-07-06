<tr>
<td class="header">
<a href="{{ $url }}" style="display: inline-block;">
@if (trim($slot) === 'AgriBilis')
<img src="{{ asset('frontend/images/logos/agribilis-logo.png') }}" class="logo" alt="AgriBilis Logo">
@else
{{ $slot }}
@endif
</a>
</td>
</tr>
