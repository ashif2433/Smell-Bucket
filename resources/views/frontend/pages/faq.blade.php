@extends('frontend.components.layout')

@section('title')
    FAQ
@endsection


@section('topmenu')
    @include('frontend.components.topmenu')
@endsection
@push('css')
    <style>
        .faq-container {
        width: 80%;
        max-width: 900px;
        margin: auto;
        background: white;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }

        h2 {
        font-size: 36px;
        font-weight: bold;
        text-align: center;
        position: relative;
        display: inline-block;
        padding-bottom: 10px;
        overflow: hidden;
        }

        h2::after {
        content: "";
        display: block;
        width: 0;
        height: 4px;
        background: #006545;
        position: absolute;
        bottom: 0;
        left: 0;
        border-radius: 5px;
        animation: underlineEffect 1s ease-out forwards;
        }

        @keyframes underlineEffect {
        0% {
            width: 0;
        }
        100% {
            width: 100%;
        }
        }

        .faq-item {
        border-bottom: 2px solid #ddd;
        padding: 20px 0;
        }

        .faq-question {
        width: 100%;
        background: none;
        border: none;
        text-align: left;
        font-size: 24px;
        font-weight: bold;
        padding: 20px;
        cursor: pointer;
        transition: background 0.3s;
        display: flex;
        justify-content: space-between;
        align-items: center;
        }

        .faq-question:hover {
        background: #f1f1f1;
        }

        .arrow {
        transition: transform 0.3s ease;
        font-size: 26px;
        }

        .faq-answer {
        display: none;
        padding: 20px;
        font-size: 20px;
        color: #333;
        text-align: left;
        background: #f9f9f9;
        border-radius: 10px;
        }

        .hidden {
        display: none;
        }

        #viewMore,
        #viewLess {
        margin-top: 20px;
        display: block;
        width: 100%;
        background: #006545;
        color: white;
        padding: 18px;
        border: none;
        cursor: pointer;
        font-size: 20px;
        border-radius: 10px;
        }

        #viewMore:hover,
        #viewLess:hover {
        background: #02835a;
        }

    </style>
@endpush

@section('content')
    <main class="main py-5">
        <div class="faq-container">
            <h2>Frequently Asked Questions</h2>

            <div class="faq-list">
                <div class="faq-item">
                    <button class="faq-question">
                        Q: How do I place an order?
                    <span class="arrow">▼</span>
                    </button>
                    <div class="faq-answer">
                    <p>A: Simply browse our products, add your desired items to the cart, and proceed to checkout. Follow the prompts to complete your purchase.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <button class="faq-question">
                        Q: Can I modify or cancel my order after placing it?
                    <span class="arrow">▼</span>
                    </button>
                    <div class="faq-answer">
                    <p>A: We process orders quickly, but if you contact us within [1 hour], we’ll do our best to make changes or cancel it.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <button class="faq-question">
                        Q: Do I need an account to order?
                    <span class="arrow">▼</span>
                    </button>
                    <div class="faq-answer">
                    <p>A: No, but creating an account helps you track your orders and makes future purchases faster.</p>
                    </div>
                </div>

                @foreach ($faq as $item)
                    <div class="faq-item hidden">
                        <button class="faq-question">
                            {{ $item->question }}
                        <span class="arrow">▼</span>
                        </button>
                        <div class="faq-answer">
                        <p>{{ $item->answer }}</p>
                        </div>
                    </div>
                @endforeach
            </div>

            <button id="viewMore">View More</button>
            <button id="viewLess" style="display: none;">View Less</button>
        </div>
    </main>
@endsection

@push('js')
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const questions = document.querySelectorAll(".faq-question");
            const viewMoreBtn = document.getElementById("viewMore");
            const viewLessBtn = document.getElementById("viewLess");
            const hiddenFaqs = document.querySelectorAll(".faq-item.hidden");

            let index = 0;
            const batchSize = 3; // Show 3 questions at a time

            // Toggle FAQ answers and rotate arrow
            questions.forEach((button) => {
            button.addEventListener("click", function () {
                let answer = this.nextElementSibling;
                let arrow = this.querySelector(".arrow");

                if (answer.style.display === "block") {
                answer.style.display = "none";
                arrow.style.transform = "rotate(0deg)";
                } else {
                answer.style.display = "block";
                arrow.style.transform = "rotate(180deg)";
                }
            });
            });

            // Show next batch of 3 FAQs
            viewMoreBtn.addEventListener("click", function () {
            for (let i = index; i < index + batchSize && i < hiddenFaqs.length; i++) {
                hiddenFaqs[i].style.display = "block";
            }
            index += batchSize;

            if (index >= hiddenFaqs.length) {
                viewMoreBtn.style.display = "none";
                viewLessBtn.style.display = "inline-block";
            }
            });

            // Hide extra FAQs
            viewLessBtn.addEventListener("click", function () {
            hiddenFaqs.forEach((faq) => (faq.style.display = "none"));
            index = 0;
            viewMoreBtn.style.display = "inline-block";
            viewLessBtn.style.display = "none";
            });
        });
    </script>
@endpush
