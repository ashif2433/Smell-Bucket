<?php

namespace App\Mail;

use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendOtpCode extends Mailable
{
    use SerializesModels;

    public $otpCode;

    /**
     * Create a new message instance.
     *
     * @param $otpCode
     */
    public function __construct($otpCode)
    {
        $this->otpCode = $otpCode;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Your OTP Code')
                    ->view('emails.sendOtpCode'); // The Blade view to render the OTP email content
    }
}
