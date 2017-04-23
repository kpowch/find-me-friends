import React from 'react';
import ReactDOM from 'react-dom';

class SuggestionList extends React.Component {

  render() {
    return (
      <main className="sidebar">
        <div className="first-choice"></div>
        <div className="second-choice"></div>
        <div className="third-choice"></div>
      </main>
    );
  }
}

export default SuggestionList;